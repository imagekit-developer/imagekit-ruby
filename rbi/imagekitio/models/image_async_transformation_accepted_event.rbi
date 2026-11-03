# typed: strong

module Imagekitio
  module Models
    class ImageAsyncTransformationAcceptedEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::ImageAsyncTransformationAcceptedEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp when the event was created in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::ImageAsyncTransformationAcceptedEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      # Information about the original request that triggered the image transformation.
      sig do
        returns(Imagekitio::ImageAsyncTransformationAcceptedEvent::Request)
      end
      attr_reader :request

      sig do
        params(
          request:
            Imagekitio::ImageAsyncTransformationAcceptedEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a new asynchronous image transformation request is accepted for
      # processing. This event confirms that ImageKit has received and queued your
      # transformation request. Use this for debugging and tracking transformation
      # lifecycle.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::OrHash,
          request:
            Imagekitio::ImageAsyncTransformationAcceptedEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp when the event was created in ISO8601 format.
        created_at:,
        data:,
        # Information about the original request that triggered the image transformation.
        request:,
        type: :"image.async-transformation.accepted"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::ImageAsyncTransformationAcceptedEvent::Data,
            request: Imagekitio::ImageAsyncTransformationAcceptedEvent::Request,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Data < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ImageAsyncTransformationAcceptedEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # Information about the source image asset being transformed.
        sig do
          returns(
            Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Asset
          )
        end
        attr_reader :asset

        sig do
          params(
            asset:
              Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        # Base information about an image transformation request.
        sig do
          returns(
            Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset:
              Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Asset::OrHash,
            transformation:
              Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Information about the source image asset being transformed.
          asset:,
          # Base information about an image transformation request.
          transformation:
        )
        end

        sig do
          override.returns(
            {
              asset:
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Asset,
              transformation:
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Asset,
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
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          # Type of transformation. Always `image-transformation`.
          sig do
            returns(
              Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Options of the requested transformation.
          sig do
            returns(
              T.nilable(
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          # Base information about an image transformation request.
          sig do
            params(
              type:
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type::OrSymbol,
              options:
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Type of transformation. Always `image-transformation`.
            type:,
            # Options of the requested transformation.
            options: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type::TaggedSymbol,
                options:
                  Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options
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
                  Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IMAGE_TRANSFORMATION =
              T.let(
                :"image-transformation",
                Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Type::TaggedSymbol
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
                  Imagekitio::ImageAsyncTransformationAcceptedEvent::Data::Transformation::Options,
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
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::ImageAsyncTransformationAcceptedEvent::Request,
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
    end
  end
end
