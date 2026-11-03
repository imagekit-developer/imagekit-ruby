# frozen_string_literal: true

module Imagekitio
  module Models
    class ImageAsyncTransformationAcceptedEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp when the event was created in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data]
      required :data, -> { Imagekitio::ImageAsyncTransformationAcceptedEvent::Data }

      # @!attribute request
      #   Information about the original request that triggered the image transformation.
      #
      #   @return [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Request]
      required :request, -> { Imagekitio::ImageAsyncTransformationAcceptedEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"image.async-transformation.accepted"]
      required :type, const: :"image.async-transformation.accepted"

      # @!method initialize(created_at:, data:, request:, type: :"image.async-transformation.accepted")
      #   Triggered when a new asynchronous image transformation request is accepted for
      #   processing. This event confirms that ImageKit has received and queued your
      #   transformation request. Use this for debugging and tracking transformation
      #   lifecycle.
      #
      #   @param created_at [Time] Timestamp when the event was created in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data]
      #
      #   @param request [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Request] Information about the original request that triggered the image transformation.
      #
      #   @param type [Symbol, :"image.async-transformation.accepted"]

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute asset
        #   Information about the source image asset being transformed.
        #
        #   @return [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Asset]
        required :asset, -> { Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Asset }

        # @!attribute transformation
        #   Base information about an image transformation request.
        #
        #   @return [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation]
        required :transformation, -> { Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Asset] Information about the source image asset being transformed.
        #
        #   @param transformation [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation] Base information about an image transformation request.

        # @see Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data#asset
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

        # @see Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute type
          #   Type of transformation. Always `image-transformation`.
          #
          #   @return [Symbol, Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type }

          # @!attribute options
          #   Options of the requested transformation.
          #
          #   @return [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options }

          # @!method initialize(type:, options: nil)
          #   Base information about an image transformation request.
          #
          #   @param type [Symbol, Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type] Type of transformation. Always `image-transformation`.
          #
          #   @param options [Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options] Options of the requested transformation.

          # Type of transformation. Always `image-transformation`.
          #
          # @see Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation#type
          module Type
            extend Imagekitio::Internal::Type::Enum

            IMAGE_TRANSFORMATION = :"image-transformation"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation#options
          class Options < Imagekitio::Internal::Type::BaseModel
            # @!attribute transformation
            #   The transformation string from the request URL, for example `e-removedotbg`. Not
            #   present if the URL has no transformation.
            #
            #   @return [String, nil]
            optional :transformation, String

            # @!method initialize(transformation: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options}
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
