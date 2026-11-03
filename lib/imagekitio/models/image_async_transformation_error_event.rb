# frozen_string_literal: true

module Imagekitio
  module Models
    class ImageAsyncTransformationErrorEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp when the event was created in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data]
      required :data, -> { Imagekitio::ImageAsyncTransformationErrorEvent::Data }

      # @!attribute request
      #   Information about the original request that triggered the image transformation.
      #
      #   @return [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Request]
      required :request, -> { Imagekitio::ImageAsyncTransformationErrorEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"image.async-transformation.error"]
      required :type, const: :"image.async-transformation.error"

      # @!method initialize(created_at:, data:, request:, type: :"image.async-transformation.error")
      #   Triggered when an asynchronous image transformation fails. Listen to this
      #   webhook to log error reasons and debug issues. Check your origin and URL
      #   endpoint settings if the reason is related to download failure. For other
      #   errors, contact ImageKit support.
      #
      #   @param created_at [Time] Timestamp when the event was created in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data]
      #
      #   @param request [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Request] Information about the original request that triggered the image transformation.
      #
      #   @param type [Symbol, :"image.async-transformation.error"]

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute asset
        #   Information about the source image asset being transformed.
        #
        #   @return [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Asset]
        required :asset, -> { Imagekitio::ImageAsyncTransformationErrorEvent::Data::Asset }

        # @!attribute transformation
        #
        #   @return [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation]
        required :transformation, -> { Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Asset] Information about the source image asset being transformed.
        #
        #   @param transformation [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation]

        # @see Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data#asset
        class Asset < Imagekitio::Internal::Type::BaseModel
          # @!attribute url
          #   URL of the source image, without the transformation.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:)
          #   Information about the source image asset being transformed.
          #
          #   @param url [String] URL of the source image, without the transformation.
        end

        # @see Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute type
          #   Type of transformation. Always `image-transformation`.
          #
          #   @return [Symbol, Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Type }

          # @!attribute error
          #   Details about the transformation error.
          #
          #   @return [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Error, nil]
          optional :error, -> { Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error }

          # @!attribute options
          #   Options of the requested transformation.
          #
          #   @return [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Options }

          # @!method initialize(type:, error: nil, options: nil)
          #   @param type [Symbol, Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Type] Type of transformation. Always `image-transformation`.
          #
          #   @param error [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Error] Details about the transformation error.
          #
          #   @param options [Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Options] Options of the requested transformation.

          # Type of transformation. Always `image-transformation`.
          #
          # @see Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation#type
          module Type
            extend Imagekitio::Internal::Type::Enum

            IMAGE_TRANSFORMATION = :"image-transformation"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation#error
          class Error < Imagekitio::Internal::Type::BaseModel
            # @!attribute reason
            #   Specific reason for the transformation failure:
            #
            #   - `download_failed`: Could not download the source image
            #   - `invalid_transformation`: The requested transformation is invalid
            #   - `limit_exceeded`: The source image or transformation exceeds a limit
            #   - `internal_server_error`: Unexpected server error
            #
            #   @return [Symbol, Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason]
            required :reason,
                     enum: -> { Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason }

            # @!attribute message
            #   A description of the error, when available.
            #
            #   @return [String, nil]
            optional :message, String

            # @!method initialize(reason:, message: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Error}
            #   for more details.
            #
            #   Details about the transformation error.
            #
            #   @param reason [Symbol, Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason] Specific reason for the transformation failure:
            #
            #   @param message [String] A description of the error, when available.

            # Specific reason for the transformation failure:
            #
            # - `download_failed`: Could not download the source image
            # - `invalid_transformation`: The requested transformation is invalid
            # - `limit_exceeded`: The source image or transformation exceeds a limit
            # - `internal_server_error`: Unexpected server error
            #
            # @see Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Error#reason
            module Reason
              extend Imagekitio::Internal::Type::Enum

              DOWNLOAD_FAILED = :download_failed
              INVALID_TRANSFORMATION = :invalid_transformation
              LIMIT_EXCEEDED = :limit_exceeded
              INTERNAL_SERVER_ERROR = :internal_server_error

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation#options
          class Options < Imagekitio::Internal::Type::BaseModel
            # @!attribute transformation
            #   The transformation string from the request URL, for example `e-removedotbg`. Not
            #   present if the URL has no transformation.
            #
            #   @return [String, nil]
            optional :transformation, String

            # @!method initialize(transformation: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::ImageAsyncTransformationErrorEvent::Data::Transformation::Options}
            #   for more details.
            #
            #   Options of the requested transformation.
            #
            #   @param transformation [String] The transformation string from the request URL, for example `e-removedotbg`. Not
          end
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        # @!attribute url
        #   Full URL of the transformation request that was submitted.
        #
        #   @return [String]
        required :url, String

        # @!attribute x_request_id
        #   Unique identifier for the originating transformation request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!attribute user_agent
        #   User-Agent header from the original request that triggered the transformation.
        #
        #   @return [String, nil]
        optional :user_agent, String

        # @!method initialize(url:, x_request_id:, user_agent: nil)
        #   Information about the original request that triggered the image transformation.
        #
        #   @param url [String] Full URL of the transformation request that was submitted.
        #
        #   @param x_request_id [String] Unique identifier for the originating transformation request.
        #
        #   @param user_agent [String] User-Agent header from the original request that triggered the transformation.
      end
    end
  end
end
