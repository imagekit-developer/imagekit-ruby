# frozen_string_literal: true

module Imagekitio
  module Models
    class UploadPostTransformSuccessEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::UploadPostTransformSuccessEvent::Data]
      required :data, -> { Imagekitio::UploadPostTransformSuccessEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekitio::Models::UploadPostTransformSuccessEvent::Request]
      required :request, -> { Imagekitio::UploadPostTransformSuccessEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"upload.post-transform.success"]
      required :type, const: :"upload.post-transform.success"

      # @!method initialize(created_at:, data:, request:, type: :"upload.post-transform.success")
      #   Triggered when a post-transformation completes successfully. The transformed
      #   version of the file is now ready and can be accessed via the provided URL. Note
      #   that each post-transformation generates a separate webhook event.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::UploadPostTransformSuccessEvent::Data]
      #
      #   @param request [Imagekitio::Models::UploadPostTransformSuccessEvent::Request]
      #
      #   @param type [Symbol, :"upload.post-transform.success"]

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute file_id
        #   Unique identifier of the originally uploaded file.
        #
        #   @return [String]
        required :file_id, String, api_name: :fileId

        # @!attribute name
        #   Name of the file.
        #
        #   @return [String]
        required :name, String

        # @!attribute url
        #   URL of the generated post-transformation.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(file_id:, name:, url:)
        #   @param file_id [String] Unique identifier of the originally uploaded file.
        #
        #   @param name [String] Name of the file.
        #
        #   @param url [String] URL of the generated post-transformation.
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        # @!attribute transformation
        #
        #   @return [Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation]
        required :transformation, -> { Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation }

        # @!attribute x_request_id
        #   Unique identifier for the originating request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!method initialize(transformation:, x_request_id:)
        #   @param transformation [Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation]
        #
        #   @param x_request_id [String] Unique identifier for the originating request.

        # @see Imagekitio::Models::UploadPostTransformSuccessEvent::Request#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute type
          #   Type of the requested post-transformation.
          #
          #   @return [Symbol, Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation::Type]
          required :type, enum: -> { Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type }

          # @!attribute protocol
          #   Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @return [Symbol, Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation::Protocol, nil]
          optional :protocol,
                   enum: -> { Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol }

          # @!attribute value
          #   Value for the requested transformation type.
          #
          #   @return [String, nil]
          optional :value, String

          # @!method initialize(type:, protocol: nil, value: nil)
          #   @param type [Symbol, Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation::Type] Type of the requested post-transformation.
          #
          #   @param protocol [Symbol, Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation::Protocol] Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @param value [String] Value for the requested transformation type.

          # Type of the requested post-transformation.
          #
          # @see Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation#type
          module Type
            extend Imagekitio::Internal::Type::Enum

            TRANSFORMATION = :transformation
            ABS = :abs
            GIF_TO_VIDEO = :"gif-to-video"
            THUMBNAIL = :thumbnail

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          # @see Imagekitio::Models::UploadPostTransformSuccessEvent::Request::Transformation#protocol
          module Protocol
            extend Imagekitio::Internal::Type::Enum

            HLS = :hls
            DASH = :dash

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
