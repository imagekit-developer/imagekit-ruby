# frozen_string_literal: true

module Imagekitio
  module Models
    class UploadPreTransformErrorEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp of when the event occurred in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::UploadPreTransformErrorEvent::Data]
      required :data, -> { Imagekitio::UploadPreTransformErrorEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekitio::Models::UploadPreTransformErrorEvent::Request]
      required :request, -> { Imagekitio::UploadPreTransformErrorEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"upload.pre-transform.error"]
      required :type, const: :"upload.pre-transform.error"

      # @!method initialize(created_at:, data:, request:, type: :"upload.pre-transform.error")
      #   Triggered when a pre-transformation fails. The file upload may have been
      #   accepted, but the requested transformation could not be applied.
      #
      #   @param created_at [Time] Timestamp of when the event occurred in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::UploadPreTransformErrorEvent::Data]
      #
      #   @param request [Imagekitio::Models::UploadPreTransformErrorEvent::Request]
      #
      #   @param type [Symbol, :"upload.pre-transform.error"]

      class Data < Imagekitio::Internal::Type::BaseModel
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
        #   @return [Imagekitio::Models::UploadPreTransformErrorEvent::Data::Transformation]
        required :transformation, -> { Imagekitio::UploadPreTransformErrorEvent::Data::Transformation }

        # @!method initialize(name:, path:, transformation:)
        #   @param name [String] Name of the file.
        #
        #   @param path [String] Path of the file.
        #
        #   @param transformation [Imagekitio::Models::UploadPreTransformErrorEvent::Data::Transformation]

        # @see Imagekitio::Models::UploadPreTransformErrorEvent::Data#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute error
          #
          #   @return [Imagekitio::Models::UploadPreTransformErrorEvent::Data::Transformation::Error]
          required :error, -> { Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::Error }

          # @!method initialize(error:)
          #   @param error [Imagekitio::Models::UploadPreTransformErrorEvent::Data::Transformation::Error]

          # @see Imagekitio::Models::UploadPreTransformErrorEvent::Data::Transformation#error
          class Error < Imagekitio::Internal::Type::BaseModel
            # @!attribute reason
            #   Reason for the pre-transformation failure.
            #
            #   @return [String]
            required :reason, String

            # @!method initialize(reason:)
            #   @param reason [String] Reason for the pre-transformation failure.
          end
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        # @!attribute transformation
        #   The requested pre-transformation string.
        #
        #   @return [String]
        required :transformation, String

        # @!attribute x_request_id
        #   Unique identifier for the originating request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!method initialize(transformation:, x_request_id:)
        #   @param transformation [String] The requested pre-transformation string.
        #
        #   @param x_request_id [String] Unique identifier for the originating request.
      end
    end
  end
end
