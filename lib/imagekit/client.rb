# frozen_string_literal: true

module Imagekit
  class Client < Imagekit::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Your ImageKit private key starts with `private_`.
    # @return [String]
    attr_reader :private_api_key

    # Do not set this, its value is ignored
    # @return [String, nil]
    attr_reader :password

    # @return [Imagekit::Resources::CustomMetadataFields]
    attr_reader :custom_metadata_fields

    # @return [Imagekit::Resources::Files]
    attr_reader :files

    # @return [Imagekit::Resources::Assets]
    attr_reader :assets

    # @return [Imagekit::Resources::Cache]
    attr_reader :cache

    # @return [Imagekit::Resources::Folders]
    attr_reader :folders

    # @return [Imagekit::Resources::Accounts]
    attr_reader :accounts

    # @return [Imagekit::Resources::Beta]
    attr_reader :beta

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @private_api_key.nil? || @password.nil?

      base64_credentials = ["#{@private_api_key}:#{@password}"].pack("m0")
      {"authorization" => "Basic #{base64_credentials}"}
    end

    # @api private
    #
    # @return [Boolean]
    def base_url_overridden? = @base_url_overridden

    # Creates and returns a new client for interacting with the API.
    #
    # @param private_api_key [String, nil] Your ImageKit private key starts with `private_`. Defaults to
    # `ENV["IMAGEKIT_PRIVATE_API_KEY"]`
    #
    # @param password [String, nil] Do not set this, its value is ignored Defaults to `ENV["ORG_MY_PASSWORD_TOKEN"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["IMAGE_KIT_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      private_api_key: ENV["IMAGEKIT_PRIVATE_API_KEY"],
      password: ENV.fetch("ORG_MY_PASSWORD_TOKEN", "does_not_matter"),
      base_url: ENV["IMAGE_KIT_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      @base_url_overridden = !base_url.nil?

      base_url ||= "https://api.imagekit.io"

      if private_api_key.nil?
        raise ArgumentError.new("private_api_key is required, and can be set via environ: \"IMAGEKIT_PRIVATE_API_KEY\"")
      end

      @private_api_key = private_api_key.to_s
      @password = password.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @custom_metadata_fields = Imagekit::Resources::CustomMetadataFields.new(client: self)
      @files = Imagekit::Resources::Files.new(client: self)
      @assets = Imagekit::Resources::Assets.new(client: self)
      @cache = Imagekit::Resources::Cache.new(client: self)
      @folders = Imagekit::Resources::Folders.new(client: self)
      @accounts = Imagekit::Resources::Accounts.new(client: self)
      @beta = Imagekit::Resources::Beta.new(client: self)
    end
  end
end
