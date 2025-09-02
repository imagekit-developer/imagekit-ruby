# frozen_string_literal: true

module Imagekit
  module Models
    class UploadPostTransformErrorEvent < Imagekit::Internal::Type::BaseModel
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
      #   @return [Imagekit::Models::UploadPostTransformErrorEvent::Data]
      required :data, -> { Imagekit::UploadPostTransformErrorEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekit::Models::UploadPostTransformErrorEvent::Request]
      required :request, -> { Imagekit::UploadPostTransformErrorEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"upload.post-transform.error"]
      required :type, const: :"upload.post-transform.error"

      # @!method initialize(id:, created_at:, data:, request:, type: :"upload.post-transform.error")
      #   @param id [String] Unique identifier for the event.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekit::Models::UploadPostTransformErrorEvent::Data]
      #
      #   @param request [Imagekit::Models::UploadPostTransformErrorEvent::Request]
      #
      #   @param type [Symbol, :"upload.post-transform.error"]

      # @see Imagekit::Models::UploadPostTransformErrorEvent#data
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

        # @!attribute path
        #   Path of the file.
        #
        #   @return [String]
        required :path, String

        # @!attribute transformation
        #
        #   @return [Imagekit::Models::UploadPostTransformErrorEvent::Data::Transformation]
        required :transformation, -> { Imagekit::UploadPostTransformErrorEvent::Data::Transformation }

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
        #   @param transformation [Imagekit::Models::UploadPostTransformErrorEvent::Data::Transformation]
        #
        #   @param url [String] URL of the attempted post-transformation.

        # @see Imagekit::Models::UploadPostTransformErrorEvent::Data#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute error
          #
          #   @return [Imagekit::Models::UploadPostTransformErrorEvent::Data::Transformation::Error]
          required :error, -> { Imagekit::UploadPostTransformErrorEvent::Data::Transformation::Error }

          # @!method initialize(error:)
          #   @param error [Imagekit::Models::UploadPostTransformErrorEvent::Data::Transformation::Error]

          # @see Imagekit::Models::UploadPostTransformErrorEvent::Data::Transformation#error
          class Error < Imagekit::Internal::Type::BaseModel
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

      # @see Imagekit::Models::UploadPostTransformErrorEvent#request
      class Request < Imagekit::Internal::Type::BaseModel
        # @!attribute transformation
        #
        #   @return [Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation]
        required :transformation, -> { Imagekit::UploadPostTransformErrorEvent::Request::Transformation }

        # @!attribute x_request_id
        #   Unique identifier for the originating request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!method initialize(transformation:, x_request_id:)
        #   @param transformation [Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation]
        #
        #   @param x_request_id [String] Unique identifier for the originating request.

        # @see Imagekit::Models::UploadPostTransformErrorEvent::Request#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute type
          #   Type of the requested post-transformation.
          #
          #   @return [Symbol, Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation::Type]
          required :type, enum: -> { Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type }

          # @!attribute protocol
          #   Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @return [Symbol, Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation::Protocol, nil]
          optional :protocol,
                   enum: -> { Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol }

          # @!attribute value
          #   Value for the requested transformation type.
          #
          #   @return [String, nil]
          optional :value, String

          # @!method initialize(type:, protocol: nil, value: nil)
          #   @param type [Symbol, Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation::Type] Type of the requested post-transformation.
          #
          #   @param protocol [Symbol, Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation::Protocol] Only applicable if transformation type is 'abs'. Streaming protocol used.
          #
          #   @param value [String] Value for the requested transformation type.

          # Type of the requested post-transformation.
          #
          # @see Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation#type
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
          # @see Imagekit::Models::UploadPostTransformErrorEvent::Request::Transformation#protocol
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
