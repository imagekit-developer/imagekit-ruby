# frozen_string_literal: true

module Imagekitio
  module Models
    class UploadPostTransformErrorEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::UploadPostTransformErrorEvent::Data]
      required :data, -> { Imagekitio::UploadPostTransformErrorEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekitio::Models::UploadPostTransformErrorEvent::Request]
      required :request, -> { Imagekitio::UploadPostTransformErrorEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"upload.post-transform.error"]
      required :type, const: :"upload.post-transform.error"

      # @!method initialize(created_at:, data:, request:, type: :"upload.post-transform.error")
      #   Triggered when a post-transformation fails. The original file remains available,
      #   but the requested transformation could not be generated.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::UploadPostTransformErrorEvent::Data]
      #
      #   @param request [Imagekitio::Models::UploadPostTransformErrorEvent::Request]
      #
      #   @param type [Symbol, :"upload.post-transform.error"]

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

        # @!attribute path
        #   Path of the file.
        #
        #   @return [String]
        required :path, String

        # @!attribute transformation
        #
        #   @return [Imagekitio::Models::UploadPostTransformErrorEvent::Data::Transformation]
        required :transformation, -> { Imagekitio::UploadPostTransformErrorEvent::Data::Transformation }

        # @!attribute url
        #   URL of the attempted post-transformation.
        #
        #   @return [String]
        required :url, String

        # @!method initialize(file_id:, name:, path:, transformation:, url:)
        #   @param file_id [String] Unique identifier of the originally uploaded file.
        #
        #   @param name [String] Name of the file.
        #
        #   @param path [String] Path of the file.
        #
        #   @param transformation [Imagekitio::Models::UploadPostTransformErrorEvent::Data::Transformation]
        #
        #   @param url [String] URL of the attempted post-transformation.

        # @see Imagekitio::Models::UploadPostTransformErrorEvent::Data#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute error
          #
          #   @return [Imagekitio::Models::UploadPostTransformErrorEvent::Data::Transformation::Error]
          required :error, -> { Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::Error }

          # @!method initialize(error:)
          #   @param error [Imagekitio::Models::UploadPostTransformErrorEvent::Data::Transformation::Error]

          # @see Imagekitio::Models::UploadPostTransformErrorEvent::Data::Transformation#error
          class Error < Imagekitio::Internal::Type::BaseModel
            # @!attribute reason
            #   Reason for the post-transformation failure.
            #
            #   @return [String]
            required :reason, String

            # @!method initialize(reason:)
            #   @param reason [String] Reason for the post-transformation failure.
          end
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        # @!attribute transformation
        #
        #   @return [Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation]
        required :transformation, -> { Imagekitio::UploadPostTransformErrorEvent::Request::Transformation }

        # @!attribute x_request_id
        #   Unique identifier for the originating request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!method initialize(transformation:, x_request_id:)
        #   @param transformation [Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation]
        #
        #   @param x_request_id [String] Unique identifier for the originating request.

        # @see Imagekitio::Models::UploadPostTransformErrorEvent::Request#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute type
          #   Type of the requested post-transformation.
          #
          #   @return [Symbol, Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation::Type]
          required :type, enum: -> { Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type }

          # @!attribute protocol
          #   Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @return [Symbol, Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation::Protocol, nil]
          optional :protocol,
                   enum: -> { Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol }

          # @!attribute value
          #   Value for the requested transformation type.
          #
          #   @return [String, nil]
          optional :value, String

          # @!method initialize(type:, protocol: nil, value: nil)
          #   @param type [Symbol, Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation::Type] Type of the requested post-transformation.
          #
          #   @param protocol [Symbol, Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation::Protocol] Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @param value [String] Value for the requested transformation type.

          # Type of the requested post-transformation.
          #
          # @see Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation#type
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
          # @see Imagekitio::Models::UploadPostTransformErrorEvent::Request::Transformation#protocol
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
