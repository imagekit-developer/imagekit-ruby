# frozen_string_literal: true

module Imagekit
  module Models
    class UploadPostTransformSuccessEvent < Imagekit::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the event.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekit::Models::UploadPostTransformSuccessEvent::Data]
      required :data, -> { Imagekit::UploadPostTransformSuccessEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekit::Models::UploadPostTransformSuccessEvent::Request]
      required :request, -> { Imagekit::UploadPostTransformSuccessEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"upload.post-transform.success"]
      required :type, const: :"upload.post-transform.success"

      # @!method initialize(id:, created_at:, data:, request:, type: :"upload.post-transform.success")
      #   Triggered when a post-transformation completes successfully. The transformed
      #   version of the file is now ready and can be accessed via the provided URL. Note
      #   that each post-transformation generates a separate webhook event.
      #
      #   @param id [String] Unique identifier for the event.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekit::Models::UploadPostTransformSuccessEvent::Data]
      #
      #   @param request [Imagekit::Models::UploadPostTransformSuccessEvent::Request]
      #
      #   @param type [Symbol, :"upload.post-transform.success"]

      # @see Imagekit::Models::UploadPostTransformSuccessEvent#data
      class Data < Imagekit::Internal::Type::BaseModel
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

      # @see Imagekit::Models::UploadPostTransformSuccessEvent#request
      class Request < Imagekit::Internal::Type::BaseModel
        # @!attribute transformation
        #
        #   @return [Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation]
        required :transformation, -> { Imagekit::UploadPostTransformSuccessEvent::Request::Transformation }

        # @!attribute x_request_id
        #   Unique identifier for the originating request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!method initialize(transformation:, x_request_id:)
        #   @param transformation [Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation]
        #
        #   @param x_request_id [String] Unique identifier for the originating request.

        # @see Imagekit::Models::UploadPostTransformSuccessEvent::Request#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute type
          #   Type of the requested post-transformation.
          #
          #   @return [Symbol, Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation::Type]
          required :type, enum: -> { Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type }

          # @!attribute protocol
          #   Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @return [Symbol, Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation::Protocol, nil]
          optional :protocol,
                   enum: -> { Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol }

          # @!attribute value
          #   Value for the requested transformation type.
          #
          #   @return [String, nil]
          optional :value, String

          # @!method initialize(type:, protocol: nil, value: nil)
          #   @param type [Symbol, Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation::Type] Type of the requested post-transformation.
          #
          #   @param protocol [Symbol, Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation::Protocol] Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @param value [String] Value for the requested transformation type.

          # Type of the requested post-transformation.
          #
          # @see Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation#type
          module Type
            extend Imagekit::Internal::Type::Enum

            TRANSFORMATION = :transformation
            ABS = :abs
            GIF_TO_VIDEO = :"gif-to-video"
            THUMBNAIL = :thumbnail

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          # @see Imagekit::Models::UploadPostTransformSuccessEvent::Request::Transformation#protocol
          module Protocol
            extend Imagekit::Internal::Type::Enum

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
