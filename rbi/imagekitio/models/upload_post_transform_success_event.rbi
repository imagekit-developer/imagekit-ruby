# typed: strong

module Imagekitio
  module Models
    class UploadPostTransformSuccessEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::UploadPostTransformSuccessEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::UploadPostTransformSuccessEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::UploadPostTransformSuccessEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Imagekitio::UploadPostTransformSuccessEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekitio::UploadPostTransformSuccessEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a post-transformation completes successfully. The transformed
      # version of the file is now ready and can be accessed via the provided URL. Note
      # that each post-transformation generates a separate webhook event.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::UploadPostTransformSuccessEvent::Data::OrHash,
          request: Imagekitio::UploadPostTransformSuccessEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        request:,
        type: :"upload.post-transform.success"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::UploadPostTransformSuccessEvent::Data,
            request: Imagekitio::UploadPostTransformSuccessEvent::Request,
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
              Imagekitio::UploadPostTransformSuccessEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # Unique identifier of the originally uploaded file.
        sig { returns(String) }
        attr_accessor :file_id

        # Name of the file.
        sig { returns(String) }
        attr_accessor :name

        # URL of the generated post-transformation.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(file_id: String, name: String, url: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique identifier of the originally uploaded file.
          file_id:,
          # Name of the file.
          name:,
          # URL of the generated post-transformation.
          url:
        )
        end

        sig { override.returns({ file_id: String, name: String, url: String }) }
        def to_hash
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::UploadPostTransformSuccessEvent::Request,
              Imagekitio::Internal::AnyHash
            )
          end

        sig do
          returns(
            Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        # Unique identifier for the originating request.
        sig { returns(String) }
        attr_accessor :x_request_id

        sig do
          params(
            transformation:
              Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::OrHash,
            x_request_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          transformation:,
          # Unique identifier for the originating request.
          x_request_id:
        )
        end

        sig do
          override.returns(
            {
              transformation:
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation,
              x_request_id: String
            }
          )
        end
        def to_hash
        end

        class Transformation < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          # Type of the requested post-transformation.
          sig do
            returns(
              Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol:
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::OrSymbol
            ).void
          end
          attr_writer :protocol

          # Value for the requested transformation type.
          sig { returns(T.nilable(String)) }
          attr_reader :value

          sig { params(value: String).void }
          attr_writer :value

          sig do
            params(
              type:
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::OrSymbol,
              protocol:
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::OrSymbol,
              value: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Type of the requested post-transformation.
            type:,
            # Only applicable if transformation type is 'abs'. Streaming protocol used.
            protocol: nil,
            # Value for the requested transformation type.
            value: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol,
                protocol:
                  Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol,
                value: String
              }
            )
          end
          def to_hash
          end

          # Type of the requested post-transformation.
          module Type
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TRANSFORMATION =
              T.let(
                :transformation,
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )
            ABS =
              T.let(
                :abs,
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )
            THUMBNAIL =
              T.let(
                :thumbnail,
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          module Protocol
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HLS =
              T.let(
                :hls,
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            DASH =
              T.let(
                :dash,
                Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
