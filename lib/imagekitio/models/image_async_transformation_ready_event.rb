# frozen_string_literal: true

module Imagekitio
  module Models
    class ImageAsyncTransformationReadyEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp when the event was created in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data]
      required :data, -> { Imagekitio::ImageAsyncTransformationReadyEvent::Data }

      # @!attribute request
      #   Information about the original request that triggered the image transformation.
      #
      #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Request]
      required :request, -> { Imagekitio::ImageAsyncTransformationReadyEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"image.async-transformation.ready"]
      required :type, const: :"image.async-transformation.ready"

      # @!attribute timings
      #   Performance metrics for the transformation process.
      #
      #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Timings, nil]
      optional :timings, -> { Imagekitio::ImageAsyncTransformationReadyEvent::Timings }

      # @!method initialize(created_at:, data:, request:, timings: nil, type: :"image.async-transformation.ready")
      #   Triggered when an asynchronous image transformation is finished and the
      #   transformed image is ready to be served. Listen to this webhook and update any
      #   flags in your database or CMS so your application can start displaying the
      #   transformed image to users.
      #
      #   @param created_at [Time] Timestamp when the event was created in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data]
      #
      #   @param request [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Request] Information about the original request that triggered the image transformation.
      #
      #   @param timings [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Timings] Performance metrics for the transformation process.
      #
      #   @param type [Symbol, :"image.async-transformation.ready"]

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute asset
        #   Information about the source image asset being transformed.
        #
        #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Asset]
        required :asset, -> { Imagekitio::ImageAsyncTransformationReadyEvent::Data::Asset }

        # @!attribute transformation
        #
        #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation]
        required :transformation, -> { Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Asset] Information about the source image asset being transformed.
        #
        #   @param transformation [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation]

        # @see Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data#asset
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

        # @see Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute type
          #   Type of transformation. Always `image-transformation`.
          #
          #   @return [Symbol, Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Type }

          # @!attribute options
          #   Options of the requested transformation.
          #
          #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Options }

          # @!attribute output
          #   Information about the transformed output image.
          #
          #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Output, nil]
          optional :output, -> { Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output }

          # @!method initialize(type:, options: nil, output: nil)
          #   @param type [Symbol, Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Type] Type of transformation. Always `image-transformation`.
          #
          #   @param options [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Options] Options of the requested transformation.
          #
          #   @param output [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Output] Information about the transformed output image.

          # Type of transformation. Always `image-transformation`.
          #
          # @see Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation#type
          module Type
            extend Imagekitio::Internal::Type::Enum

            IMAGE_TRANSFORMATION = :"image-transformation"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation#options
          class Options < Imagekitio::Internal::Type::BaseModel
            # @!attribute transformation
            #   The transformation string from the request URL, for example `e-removedotbg`. Not
            #   present if the URL has no transformation.
            #
            #   @return [String, nil]
            optional :transformation, String

            # @!method initialize(transformation: nil)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Options}
            #   for more details.
            #
            #   Options of the requested transformation.
            #
            #   @param transformation [String] The transformation string from the request URL, for example `e-removedotbg`. Not
          end

          # @see Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation#output
          class Output < Imagekitio::Internal::Type::BaseModel
            # @!attribute url
            #   URL to access the transformed image.
            #
            #   @return [String]
            required :url, String

            # @!attribute image_metadata
            #   Metadata of the output image.
            #
            #   @return [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata, nil]
            optional :image_metadata,
                     -> { Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata }

            # @!method initialize(url:, image_metadata: nil)
            #   Information about the transformed output image.
            #
            #   @param url [String] URL to access the transformed image.
            #
            #   @param image_metadata [Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata] Metadata of the output image.

            # @see Imagekitio::Models::ImageAsyncTransformationReadyEvent::Data::Transformation::Output#image_metadata
            class ImageMetadata < Imagekitio::Internal::Type::BaseModel
              # @!attribute size
              #   Size of the output image in bytes.
              #
              #   @return [Integer]
              required :size, Integer

              # @!attribute format_
              #   Format of the output image, for example `webp` or `png`.
              #
              #   @return [String, nil]
              optional :format_, String, api_name: :format

              # @!method initialize(size:, format_: nil)
              #   Metadata of the output image.
              #
              #   @param size [Integer] Size of the output image in bytes.
              #
              #   @param format_ [String] Format of the output image, for example `webp` or `png`.
            end
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

      class Timings < Imagekitio::Internal::Type::BaseModel
        # @!attribute processing_duration
        #   Time spent processing the transformation, in milliseconds.
        #
        #   @return [Integer, nil]
        optional :processing_duration, Integer

        # @!attribute queue_duration
        #   Time the request waited in the queue before processing started, in milliseconds.
        #
        #   @return [Integer, nil]
        optional :queue_duration, Integer

        # @!method initialize(processing_duration: nil, queue_duration: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::ImageAsyncTransformationReadyEvent::Timings} for more
        #   details.
        #
        #   Performance metrics for the transformation process.
        #
        #   @param processing_duration [Integer] Time spent processing the transformation, in milliseconds.
        #
        #   @param queue_duration [Integer] Time the request waited in the queue before processing started, in milliseconds.
      end
    end
  end
end
