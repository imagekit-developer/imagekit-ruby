# frozen_string_literal: true

require_relative "transformation_utils"
require_relative "crypto_utils"
require_relative "uuid_utils"
require "uri"
require "cgi"
require "base64"

module Imagekit
  module Helpers
    class Helper
      # Constants for URL building and signing
      TRANSFORMATION_PARAMETER = "tr"
      SIGNATURE_PARAMETER = "ik-s"
      TIMESTAMP_PARAMETER = "ik-t"
      DEFAULT_TIMESTAMP = 9_999_999_999
      SIMPLE_OVERLAY_PATH_REGEX = %r{^[a-zA-Z0-9\-._/ ]*$}
      SIMPLE_OVERLAY_TEXT_REGEX = /^[a-zA-Z0-9\-._ ]*$/

      # Builds a URL with transformations applied
      #
      # @param options [Imagekit::Models::SrcOptions] Options for generating ImageKit URLs with transformations
      # @return [String] The built URL with transformations
      def build_url(options)
        # Convert to hash if it's a model object
        opts = options.respond_to?(:to_h) ? options.to_h : options.dup

        # Set defaults
        opts[:url_endpoint] ||= opts["url_endpoint"] || ""
        opts[:src] ||= opts["src"] || ""
        opts[:transformation_position] ||= opts["transformation_position"] || :query

        return "" if opts[:src].nil? || opts[:src].empty?

        src = opts[:src].to_s
        is_absolute_url = src.start_with?("http://", "https://")

        begin
          if is_absolute_url
            url_obj = URI.parse(src)
            is_src_parameter_used_for_url = true
          else
            url_obj = URI.parse(opts[:url_endpoint].to_s)
          end
        rescue URI::InvalidURIError
          return ""
        end

        # Add query parameters
        query_params = opts[:query_parameters] || opts["query_parameters"] || {}
        existing_params = CGI.parse(url_obj.query || "")
        query_params.each do |key, value|
          existing_params[key.to_s] = [value.to_s]
        end

        # Build transformation string
        transformation_string = build_transformation_string(opts[:transformation] || opts["transformation"])

        add_as_query = TransformationUtils.add_as_query_parameter?(opts) || is_src_parameter_used_for_url
        transformation_placeholder = "PLEASEREPLACEJUSTBEFORESIGN"

        unless is_absolute_url
          # For non-absolute URLs, construct the path
          endpoint_path = url_obj.path
          path_parts = []

          # Add endpoint path if it's not empty
          if !endpoint_path.empty? && endpoint_path != "/"
            path_parts << endpoint_path
          end

          if !transformation_string.empty? && !add_as_query
            path_parts << "#{TRANSFORMATION_PARAMETER}#{TransformationUtils.get_chain_transform_delimiter}#{transformation_placeholder}"
          end

          path_parts << src
          url_obj.path = path_join(path_parts)
        end

        # Build query string
        unless existing_params.empty?
          url_obj.query = existing_params.map { |k, v| "#{CGI.escape(k)}=#{CGI.escape(v.first)}" }.join("&")
        end

        # Build final URL
        final_url = url_obj.to_s

        # Add transformation parameter manually to avoid URL encoding
        if !transformation_string.empty? && add_as_query
          separator = url_obj.query && !url_obj.query.empty? ? "&" : "?"
          final_url = "#{final_url}#{separator}#{TRANSFORMATION_PARAMETER}=#{transformation_placeholder}"
        end

        # Replace placeholder with actual transformation string
        unless transformation_string.empty?
          final_url = final_url.gsub(transformation_placeholder, transformation_string)
        end

        # Sign the URL if needed
        if opts[:signed] == true || (opts[:expires_in] && opts[:expires_in].to_i > 0)
          expiry_timestamp = get_signature_timestamp(opts[:expires_in])

          url_signature = get_signature(
            private_key: @client.private_key,
            url: final_url,
            url_endpoint: opts[:url_endpoint].to_s,
            expiry_timestamp: expiry_timestamp
          )

          # Add signature parameters
          final_url_uri = URI.parse(final_url)
          has_existing_params = final_url_uri.query && !final_url_uri.query.empty?
          separator = has_existing_params ? "&" : "?"

          if expiry_timestamp && expiry_timestamp != DEFAULT_TIMESTAMP
            final_url = "#{final_url}#{separator}#{TIMESTAMP_PARAMETER}=#{expiry_timestamp}"
            final_url = "#{final_url}&#{SIGNATURE_PARAMETER}=#{url_signature}"
          else
            final_url = "#{final_url}#{separator}#{SIGNATURE_PARAMETER}=#{url_signature}"
          end
        end

        final_url
      end

      # Generates transformation string from transformation objects
      #
      # @param transformations [Array] Array of transformation objects
      # @return [String] The transformation string (e.g., "w-400,h-300")
      def build_transformation_string(transformations)
        return "" unless transformations.is_a?(Array)

        parsed_transforms = []

        transformations.each do |transform|
          next unless transform

          # Convert to hash if it's a model object
          current_transform = transform.respond_to?(:to_h) ? transform.to_h : transform
          next unless current_transform.is_a?(Hash)

          parsed_transform_step = []

          current_transform.each do |key, value|
            next if value.nil? || value.to_s.empty?

            # Handle overlay separately
            if key.to_s == "overlay" && (value.is_a?(Hash) || value.respond_to?(:to_h))
              # Pass model object or hash directly to process_overlay
              raw_string = process_overlay(value)
              if raw_string && !raw_string.strip.empty?
                parsed_transform_step << raw_string
              end
              next
            end

            transform_key = TransformationUtils.get_transform_key(key)
            transform_key = key.to_s if transform_key.empty?

            next if transform_key.empty?

            # Handle special boolean effects
            boolean_effects = %w[e-grayscale e-contrast e-removedotbg e-bgremove e-upscale e-retouch e-genvar]
            if boolean_effects.include?(transform_key)
              if value == true || value == "-" || value == "true"
                parsed_transform_step << transform_key
              end
              next
            end

            # Handle effects that can be boolean or have values
            value_effects = %w[e-sharpen e-shadow e-gradient e-usm e-dropshadow]
            if value_effects.include?(transform_key) &&
               (value.to_s.strip.empty? || value == true || value == "true")
              parsed_transform_step << transform_key
              next
            end

            # Handle raw parameter
            if key.to_s == "raw"
              parsed_transform_step << value.to_s
              next
            end

            # Handle special cases for di and ff (need special encoding)
            if %w[di ff].include?(transform_key)
              processed_value = remove_leading_slash(remove_trailing_slash(value.to_s))
              processed_value = processed_value.gsub("/", "@@")
              value = processed_value
            end

            # Handle streaming resolutions array
            if transform_key == "sr" && value.is_a?(Array)
              value = value.join("_")
            end

            # Special case for trim with empty string
            if transform_key == "t" && value.to_s.strip.empty?
              value = "true"
            end

            # Convert numeric values to integers if they're whole numbers
            if value.is_a?(Numeric)
              value = value.to_i if value == value.to_i
            end

            parsed_transform_step << "#{transform_key}#{TransformationUtils.get_transform_key_value_delimiter}#{value}"
          end

          unless parsed_transform_step.empty?
            parsed_transforms << parsed_transform_step.join(TransformationUtils.get_transform_delimiter)
          end
        end

        parsed_transforms.join(TransformationUtils.get_chain_transform_delimiter)
      end

      # Generates authentication parameters for client-side file uploads using ImageKit's Upload API V1.
      #
      # This method creates the required authentication signature that allows secure file uploads
      # directly from the browser or mobile applications without exposing your private API key.
      # The generated parameters include a unique token, expiration timestamp, and HMAC signature.
      #
      # @param token [String, nil] Custom token for the upload session. If not provided, a UUID v4 will be generated automatically.
      # @param expire [Integer, nil] Expiration time in seconds from now. If not provided, defaults to 1800 seconds (30 minutes).
      # @return [Hash] Authentication parameters object containing:
      #   - token: Unique identifier for this upload session
      #   - expire: Unix timestamp when these parameters expire
      #   - signature: HMAC-SHA1 signature for authenticating the upload
      def get_authentication_parameters(token: nil, expire: nil)
        default_time_diff = 60 * 30
        default_expire = Time.now.to_i + default_time_diff

        # Handle falsy values - empty string and nil should generate new token
        final_token = token.nil? || token.to_s.empty? ? generate_token : token
        # Handle falsy values - nil and 0 should use default expire
        final_expire = expire.nil? || expire == 0 ? default_expire : expire

        get_authentication_parameters_internal(final_token, final_expire, @client.private_key)
      end

      # @api private
      #
      # @param client [Imagekit::Client]
      def initialize(client:)
        @client = client
      end

      private

      # Generate a 32-character hex token
      def generate_token
        # Generate 16 random bytes and convert to hex (32 characters)
        require("securerandom")
        SecureRandom.hex(16)
      end

      # Internal method to generate authentication parameters
      def get_authentication_parameters_internal(token, expire, private_key)
        auth_parameters = {
          token: token,
          expire: expire,
          signature: ""
        }

        signature = CryptoUtils.create_hmac_sha1(private_key, token.to_s + expire.to_s)
        auth_parameters[:signature] = signature

        auth_parameters
      end

      # Remove trailing slash from string
      def remove_trailing_slash(str)
        return str unless str.is_a?(String) && str.end_with?("/")
        str.chomp("/")
      end

      # Remove leading slash from string
      def remove_leading_slash(str)
        return str unless str.is_a?(String) && str.start_with?("/")
        str[1..-1]
      end

      # RFC 3986 path encoding - matches Node.js encodeURIPath exactly
      # From Node.js: str.replace(/[^A-Za-z0-9\-._~!$&'()*+,;=:@]+/g, encodeURIComponent)
      def encode_uri_path(str)
        # Only encode characters that are NOT in the RFC 3986 path character set
        # unreserved = ALPHA / DIGIT / "-" / "." / "_" / "~"
        # sub-delims = "!" / "$" / "&" / "'" / "(" / ")" / "*" / "+" / "," / ";" / "="
        # pchar = unreserved / pct-encoded / sub-delims / ":" / "@"
        str.gsub(/[^A-Za-z0-9\-._~!$&'()*+,;=:@]+/) { |match| CGI.escape(match) }
      end

      # Join path parts (Node.js pathJoin algorithm without encoding)
      def path_join(parts, separator = "/")
        return "" if parts.nil? || parts.empty?

        # Clean up parts and join
        cleaned_parts = []

        parts.each do |part|
          part = part.to_s.strip
          next if part.empty?

          # Remove leading slashes from all parts
          part = part[1..-1] while part.start_with?(separator)

          # Remove trailing slashes from all parts
          part = part[0..-2] while part.end_with?(separator)

          cleaned_parts << part unless part.empty?
        end

        return "" if cleaned_parts.empty?

        # Join with separator and add leading slash (Node.js style)
        result = separator + cleaned_parts.join(separator)

        # Apply encoding to special characters only, preserving path structure
        result.gsub(/[^\x00-\x7F]/) { |char| CGI.escape(char) }
      end

      # Process overlay transformation (full implementation)
      def process_overlay(overlay)
        return "" unless overlay

        # Get the overlay type - handle both model objects and hashes
        if overlay.respond_to?(:type)
          # Model object - access type directly
          type = overlay.type
          overlay_obj = overlay
        elsif overlay.is_a?(Hash)
          # Hash - look for type key
          type = overlay[:type] || overlay["type"]
          # Convert to symbol keys if needed
          overlay_obj = {}
          overlay.each { |k, v| overlay_obj[k.to_sym] = v }
        else
          return ""
        end

        return "" unless type

        # Determine overlay type based on explicit type field
        case type.to_s
        when "text"
          process_text_overlay(overlay_obj)
        when "image"
          process_image_overlay(overlay_obj)
        when "video"
          process_video_overlay(overlay_obj)
        when "subtitle"
          process_subtitle_overlay(overlay_obj)
        when "solidColor"
          process_solid_color_overlay(overlay_obj)
        else
          ""
        end
      end

      # Process input path for image/video/subtitle overlays (matching Node.js processInputPath)
      def process_input_path(str, encoding)
        # Remove leading and trailing slashes
        str = remove_trailing_slash(remove_leading_slash(str))

        case encoding.to_s
        when "plain"
          "i-#{str.gsub('/', '@@')}"
        when "base64"
          "ie-#{CGI.escape(Base64.strict_encode64(str))}"
        else # auto
          if str.match?(SIMPLE_OVERLAY_PATH_REGEX)
            "i-#{str.gsub('/', '@@')}"
          else
            "ie-#{CGI.escape(Base64.strict_encode64(str))}"
          end
        end
      end

      # Process text content for text overlays (matching Node.js processText)
      def process_text(str, encoding)
        case encoding.to_s
        when "plain"
          "i-#{uri_encode(str)}"
        when "base64"
          "ie-#{uri_encode(Base64.strict_encode64(str))}"
        else # auto
          if str.match?(SIMPLE_OVERLAY_TEXT_REGEX)
            "i-#{uri_encode(str)}"
          else
            "ie-#{uri_encode(Base64.strict_encode64(str))}"
          end
        end
      end

      # URI encode like JavaScript's encodeURIComponent (uses %20 instead of +)
      def uri_encode(str)
        CGI.escape(str).gsub("+", "%20")
      end

      # Process text overlay
      def process_text_overlay(overlay)
        text = safe_get(overlay, :text)
        return "" unless text && !text.to_s.empty?

        parts = ["l-text"]

        # Handle encoding using the processText function
        encoding = safe_get(overlay, :encoding) || "auto"
        parts << process_text(text, encoding)

        # Add other overlay properties (position, timing, transformations)
        add_overlay_properties(parts, overlay)

        parts << "l-end"
        parts.join(",")
      end

      # Process image overlay
      def process_image_overlay(overlay)
        input = safe_get(overlay, :input)
        return "" unless input && !input.to_s.empty?

        parts = ["l-image"]

        # Handle encoding using the process_input_path function
        encoding = safe_get(overlay, :encoding) || "auto"
        parts << process_input_path(input, encoding)

        # Add other overlay properties
        add_overlay_properties(parts, overlay)

        parts << "l-end"
        parts.join(",")
      end

      # Process video overlay
      def process_video_overlay(overlay)
        input = safe_get(overlay, :input)
        return "" unless input && !input.to_s.empty?

        parts = ["l-video"]

        # Handle encoding using the process_input_path function
        encoding = safe_get(overlay, :encoding) || "auto"
        parts << process_input_path(input, encoding)

        # Add other overlay properties
        add_overlay_properties(parts, overlay)

        parts << "l-end"
        parts.join(",")
      end

      # Process subtitle overlay
      def process_subtitle_overlay(overlay)
        input = safe_get(overlay, :input)
        return "" unless input && !input.to_s.empty?

        parts = ["l-subtitle"]

        # Handle encoding using the process_input_path function
        encoding = safe_get(overlay, :encoding) || "auto"
        parts << process_input_path(input, encoding)

        # Add other overlay properties
        add_overlay_properties(parts, overlay)

        parts << "l-end"
        parts.join(",")
      end

      # Process solid color overlay
      def process_solid_color_overlay(overlay)
        color = safe_get(overlay, :color)
        return "" unless color && !color.to_s.empty?

        parts = ["l-image", "i-ik_canvas", "bg-#{color}"]

        # Add other overlay properties
        add_overlay_properties(parts, overlay)

        parts << "l-end"
        parts.join(",")
      end

      # Safe property access that handles both hashes and model objects
      def safe_get(obj, key)
        return nil unless obj

        # For model objects, try method access first
        if obj.respond_to?(key.to_sym)
          begin
            return obj.send(key.to_sym)
          rescue StandardError
            # Fall through to hash access if method fails
          end
        end

        # For hashes, try symbol first, then string
        if obj.respond_to?(:[])
          begin
            return obj[key.to_sym]
          rescue StandardError
            begin
              return obj[key.to_s]
            rescue StandardError
              return nil
            end
          end
        end

        nil
      end

      # Add overlay properties like position, timing, transformations (matching Node.js)
      def add_overlay_properties(parts, overlay)
        # Add position properties
        position = safe_get(overlay, :position)
        if position
          x = safe_get(position, :x)
          y = safe_get(position, :y) || safe_get(position, :y_)
          focus = safe_get(position, :focus)

          parts << "lx-#{x}" if x
          parts << "ly-#{y}" if y
          parts << "lfo-#{focus}" if focus
        end

        # Add timing properties
        timing = safe_get(overlay, :timing)
        if timing
          start = safe_get(timing, :start)
          end_time = safe_get(timing, :end) || safe_get(timing, :end_)
          duration = safe_get(timing, :duration)

          parts << "lso-#{start.to_i}" if start
          parts << "leo-#{end_time.to_i}" if end_time
          parts << "ldu-#{duration}" if duration
        end

        # Add transformation properties
        transformations = safe_get(overlay, :transformation)
        return unless transformations && transformations.is_a?(Array)
        transformation_string = build_transformation_string(transformations)
        return unless transformation_string && !transformation_string.strip.empty?
        parts << transformation_string
      end

      # Calculate expiry timestamp for URL signing
      def get_signature_timestamp(seconds)
        return DEFAULT_TIMESTAMP unless seconds && seconds.to_i > 0

        sec = seconds.to_i
        return DEFAULT_TIMESTAMP if sec <= 0

        Time.now.to_i + sec
      end

      # Generate HMAC-SHA1 signature for URL signing
      def get_signature(private_key:, url:, url_endpoint:, expiry_timestamp:)
        return "" if private_key.nil? || private_key.empty? || url.nil? || url.empty? || url_endpoint.nil?

        # Create string to sign: relative path + expiry timestamp
        endpoint_with_slash = add_trailing_slash(url_endpoint)
        string_to_sign = url.gsub(endpoint_with_slash, "") + expiry_timestamp.to_s

        CryptoUtils.create_hmac_sha1(private_key, string_to_sign)
      end

      # Add trailing slash to string if not present
      def add_trailing_slash(str)
        return str unless str.is_a?(String)
        return str if str.end_with?("/")
        str + "/"
      end
    end
  end
end
