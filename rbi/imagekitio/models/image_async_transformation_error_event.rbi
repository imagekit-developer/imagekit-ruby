# typed: strong

module Imagekitio
  module Models
    class ImageAsyncTransformationErrorEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::ImageAsyncTransformationErrorEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp when the event was created in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::ImageAsyncTransformationErrorEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::ImageAsyncTransformationErrorEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      # Information about the original request that triggered the image transformation.
      sig { returns(Imagekitio::ImageAsyncTransformationErrorEvent::Request) }
      attr_reader :request

      sig do
        params(
          request:
            Imagekitio::ImageAsyncTransformationErrorEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when an asynchronous image transformation fails. Listen to this
      # webhook to log error reasons and debug issues. Check your origin and URL
      # endpoint settings if the reason is related to download failure. For other
      # errors, contact ImageKit support.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::ImageAsyncTransformationErrorEvent::Data::OrHash,
          request:
            Imagekitio::ImageAsyncTransformationErrorEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp when the event was created in ISO8601 format.
        created_at:,
        data:,
        # Information about the original request that triggered the image transformation.
        request:,
        type: :"image.async-transformation.error"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::ImageAsyncTransformationErrorEvent::Data,
            request: Imagekitio::ImageAsyncTransformationErrorEvent::Request,
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
              Imagekitio::ImageAsyncTransformationErrorEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # Information about the source image asset being transformed.
        sig do
          returns(Imagekitio::ImageAsyncTransformationErrorEvent::Data::Asset)
        end
        attr_reader :asset

        sig do
          params(
            asset:
              Imagekitio::ImageAsyncTransformationErrorEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        sig do
          returns(
            Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset:
              Imagekitio::ImageAsyncTransformationErrorEvent::Data::Asset::OrHash,
            transformation:
              Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::OrHash
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
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Asset,
              transformation:
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Asset,
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
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          # Type of transformation. Always `image-transformation`.
          sig do
            returns(
              Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Details about the transformation error.
          sig do
            returns(
              T.nilable(
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error
              )
            )
          end
          attr_reader :error

          sig do
            params(
              error:
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::OrHash
            ).void
          end
          attr_writer :error

          # Options of the requested transformation.
          sig do
            returns(
              T.nilable(
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          sig do
            params(
              type:
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Type::OrSymbol,
              error:
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::OrHash,
              options:
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Options::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Type of transformation. Always `image-transformation`.
            type:,
            # Details about the transformation error.
            error: nil,
            # Options of the requested transformation.
            options: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol,
                error:
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error,
                options:
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Options
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
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IMAGE_TRANSFORMATION =
              T.let(
                :"image-transformation",
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Error < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Specific reason for the transformation failure:
            #
            # - `download_failed`: Could not download the source image
            # - `invalid_transformation`: The requested transformation is invalid
            # - `limit_exceeded`: The source image or transformation exceeds a limit
            # - `internal_server_error`: Unexpected server error
            sig do
              returns(
                Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
              )
            end
            attr_accessor :reason

            # A description of the error, when available.
            sig { returns(T.nilable(String)) }
            attr_reader :message

            sig { params(message: String).void }
            attr_writer :message

            # Details about the transformation error.
            sig do
              params(
                reason:
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::OrSymbol,
                message: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Specific reason for the transformation failure:
              #
              # - `download_failed`: Could not download the source image
              # - `invalid_transformation`: The requested transformation is invalid
              # - `limit_exceeded`: The source image or transformation exceeds a limit
              # - `internal_server_error`: Unexpected server error
              reason:,
              # A description of the error, when available.
              message: nil
            )
            end

            sig do
              override.returns(
                {
                  reason:
                    Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol,
                  message: String
                }
              )
            end
            def to_hash
            end

            # Specific reason for the transformation failure:
            #
            # - `download_failed`: Could not download the source image
            # - `invalid_transformation`: The requested transformation is invalid
            # - `limit_exceeded`: The source image or transformation exceeds a limit
            # - `internal_server_error`: Unexpected server error
            module Reason
              extend Imagekitio::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DOWNLOAD_FAILED =
                T.let(
                  :download_failed,
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )
              INVALID_TRANSFORMATION =
                T.let(
                  :invalid_transformation,
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )
              LIMIT_EXCEEDED =
                T.let(
                  :limit_exceeded,
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )
              INTERNAL_SERVER_ERROR =
                T.let(
                  :internal_server_error,
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Options < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::ImageAsyncTransformationErrorEvent::Data::Transformation::Options,
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
              Imagekitio::ImageAsyncTransformationErrorEvent::Request,
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
