# typed: strong

module Imagekitio
  module Models
    class ImageAsyncTransformationReadyEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::ImageAsyncTransformationReadyEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp when the event was created in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::ImageAsyncTransformationReadyEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::ImageAsyncTransformationReadyEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      # Information about the original request that triggered the image transformation.
      sig { returns(Imagekitio::ImageAsyncTransformationReadyEvent::Request) }
      attr_reader :request

      sig do
        params(
          request:
            Imagekitio::ImageAsyncTransformationReadyEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Performance metrics for the transformation process.
      sig do
        returns(
          T.nilable(Imagekitio::ImageAsyncTransformationReadyEvent::Timings)
        )
      end
      attr_reader :timings

      sig do
        params(
          timings:
            Imagekitio::ImageAsyncTransformationReadyEvent::Timings::OrHash
        ).void
      end
      attr_writer :timings

      # Triggered when an asynchronous image transformation is finished and the
      # transformed image is ready to be served. Listen to this webhook and update any
      # flags in your database or CMS so your application can start displaying the
      # transformed image to users.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::ImageAsyncTransformationReadyEvent::Data::OrHash,
          request:
            Imagekitio::ImageAsyncTransformationReadyEvent::Request::OrHash,
          timings:
            Imagekitio::ImageAsyncTransformationReadyEvent::Timings::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp when the event was created in ISO8601 format.
        created_at:,
        data:,
        # Information about the original request that triggered the image transformation.
        request:,
        # Performance metrics for the transformation process.
        timings: nil,
        type: :"image.async-transformation.ready"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::ImageAsyncTransformationReadyEvent::Data,
            request: Imagekitio::ImageAsyncTransformationReadyEvent::Request,
            type: Symbol,
            timings: Imagekitio::ImageAsyncTransformationReadyEvent::Timings
          }
        )
      end
      def to_hash
      end

      class Data < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ImageAsyncTransformationReadyEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # Information about the source image asset being transformed.
        sig do
          returns(Imagekitio::ImageAsyncTransformationReadyEvent::Data::Asset)
        end
        attr_reader :asset

        sig do
          params(
            asset:
              Imagekitio::ImageAsyncTransformationReadyEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        sig do
          returns(
            Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset:
              Imagekitio::ImageAsyncTransformationReadyEvent::Data::Asset::OrHash,
            transformation:
              Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Information about the source image asset being transformed.
          asset:,
          transformation:
        )
        end

        sig do
          override.returns(
            {
              asset:
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Asset,
              transformation:
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Asset,
                Imagekitio::Internal::AnyHash
              )
            end

          # URL of the source image, without the transformation.
          sig { returns(String) }
          attr_accessor :url

          # Information about the source image asset being transformed.
          sig { params(url: String).returns(T.attached_class) }
          def self.new(
            # URL of the source image, without the transformation.
            url:
          )
          end

          sig { override.returns({ url: String }) }
          def to_hash
          end
        end

        class Transformation < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          # Type of transformation. Always `image-transformation`.
          sig do
            returns(
              Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Options of the requested transformation.
          sig do
            returns(
              T.nilable(
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          # Information about the transformed output image.
          sig do
            returns(
              T.nilable(
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output
              )
            )
          end
          attr_reader :output

          sig do
            params(
              output:
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::OrHash
            ).void
          end
          attr_writer :output

          sig do
            params(
              type:
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Type::OrSymbol,
              options:
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Options::OrHash,
              output:
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Type of transformation. Always `image-transformation`.
            type:,
            # Options of the requested transformation.
            options: nil,
            # Information about the transformed output image.
            output: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol,
                options:
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Options,
                output:
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output
              }
            )
          end
          def to_hash
          end

          # Type of transformation. Always `image-transformation`.
          module Type
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IMAGE_TRANSFORMATION =
              T.let(
                :"image-transformation",
                Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Options < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Options,
                  Imagekitio::Internal::AnyHash
                )
              end

            # The transformation string from the request URL, for example `e-removedotbg`. Not
            # present if the URL has no transformation.
            sig { returns(T.nilable(String)) }
            attr_reader :transformation

            sig { params(transformation: String).void }
            attr_writer :transformation

            # Options of the requested transformation.
            sig { params(transformation: String).returns(T.attached_class) }
            def self.new(
              # The transformation string from the request URL, for example `e-removedotbg`. Not
              # present if the URL has no transformation.
              transformation: nil
            )
            end

            sig { override.returns({ transformation: String }) }
            def to_hash
            end
          end

          class Output < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL to access the transformed image.
            sig { returns(String) }
            attr_accessor :url

            # Metadata of the output image.
            sig do
              returns(
                T.nilable(
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata
                )
              )
            end
            attr_reader :image_metadata

            sig do
              params(
                image_metadata:
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata::OrHash
              ).void
            end
            attr_writer :image_metadata

            # Information about the transformed output image.
            sig do
              params(
                url: String,
                image_metadata:
                  Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # URL to access the transformed image.
              url:,
              # Metadata of the output image.
              image_metadata: nil
            )
            end

            sig do
              override.returns(
                {
                  url: String,
                  image_metadata:
                    Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata
                }
              )
            end
            def to_hash
            end

            class ImageMetadata < Imagekitio::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Imagekitio::ImageAsyncTransformationReadyEvent::Data::Transformation::Output::ImageMetadata,
                    Imagekitio::Internal::AnyHash
                  )
                end

              # Size of the output image in bytes.
              sig { returns(Integer) }
              attr_accessor :size

              # Format of the output image, for example `webp` or `png`.
              sig { returns(T.nilable(String)) }
              attr_reader :format_

              sig { params(format_: String).void }
              attr_writer :format_

              # Metadata of the output image.
              sig do
                params(size: Integer, format_: String).returns(T.attached_class)
              end
              def self.new(
                # Size of the output image in bytes.
                size:,
                # Format of the output image, for example `webp` or `png`.
                format_: nil
              )
              end

              sig { override.returns({ size: Integer, format_: String }) }
              def to_hash
              end
            end
          end
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ImageAsyncTransformationReadyEvent::Request,
              Imagekitio::Internal::AnyHash
            )
          end

        # Full URL of the transformation request that was submitted.
        sig { returns(String) }
        attr_accessor :url

        # Unique identifier for the originating transformation request.
        sig { returns(String) }
        attr_accessor :x_request_id

        # User-Agent header from the original request that triggered the transformation.
        sig { returns(T.nilable(String)) }
        attr_reader :user_agent

        sig { params(user_agent: String).void }
        attr_writer :user_agent

        # Information about the original request that triggered the image transformation.
        sig do
          params(url: String, x_request_id: String, user_agent: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Full URL of the transformation request that was submitted.
          url:,
          # Unique identifier for the originating transformation request.
          x_request_id:,
          # User-Agent header from the original request that triggered the transformation.
          user_agent: nil
        )
        end

        sig do
          override.returns(
            { url: String, x_request_id: String, user_agent: String }
          )
        end
        def to_hash
        end
      end

      class Timings < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ImageAsyncTransformationReadyEvent::Timings,
              Imagekitio::Internal::AnyHash
            )
          end

        # Time spent processing the transformation, in milliseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :processing_duration

        sig { params(processing_duration: Integer).void }
        attr_writer :processing_duration

        # Time the request waited in the queue before processing started, in milliseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :queue_duration

        sig { params(queue_duration: Integer).void }
        attr_writer :queue_duration

        # Performance metrics for the transformation process.
        sig do
          params(processing_duration: Integer, queue_duration: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Time spent processing the transformation, in milliseconds.
          processing_duration: nil,
          # Time the request waited in the queue before processing started, in milliseconds.
          queue_duration: nil
        )
        end

        sig do
          override.returns(
            { processing_duration: Integer, queue_duration: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
