# typed: strong

module Imagekitio
  module Models
    class UploadPostTransformErrorEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::UploadPostTransformErrorEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::UploadPostTransformErrorEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::UploadPostTransformErrorEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Imagekitio::UploadPostTransformErrorEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekitio::UploadPostTransformErrorEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a post-transformation fails. The original file remains available,
      # but the requested transformation could not be generated.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::UploadPostTransformErrorEvent::Data::OrHash,
          request: Imagekitio::UploadPostTransformErrorEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        request:,
        type: :"upload.post-transform.error"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::UploadPostTransformErrorEvent::Data,
            request: Imagekitio::UploadPostTransformErrorEvent::Request,
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
              Imagekitio::UploadPostTransformErrorEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # Unique identifier of the originally uploaded file.
        sig { returns(String) }
        attr_accessor :file_id

        # Name of the file.
        sig { returns(String) }
        attr_accessor :name

        # Path of the file.
        sig { returns(String) }
        attr_accessor :path

        sig do
          returns(
            Imagekitio::UploadPostTransformErrorEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        # URL of the attempted post-transformation.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            file_id: String,
            name: String,
            path: String,
            transformation:
              Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::OrHash,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier of the originally uploaded file.
          file_id:,
          # Name of the file.
          name:,
          # Path of the file.
          path:,
          transformation:,
          # URL of the attempted post-transformation.
          url:
        )
        end

        sig do
          override.returns(
            {
              file_id: String,
              name: String,
              path: String,
              transformation:
                Imagekitio::UploadPostTransformErrorEvent::Data::Transformation,
              url: String
            }
          )
        end
        def to_hash
        end

        class Transformation < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::UploadPostTransformErrorEvent::Data::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          sig do
            returns(
              Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::Error
            )
          end
          attr_reader :error

          sig do
            params(
              error:
                Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::Error::OrHash
            ).void
          end
          attr_writer :error

          sig do
            params(
              error:
                Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::Error::OrHash
            ).returns(T.attached_class)
          end
          def self.new(error:)
          end

          sig do
            override.returns(
              {
                error:
                  Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::Error
              }
            )
          end
          def to_hash
          end

          class Error < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::UploadPostTransformErrorEvent::Data::Transformation::Error,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Reason for the post-transformation failure.
            sig { returns(String) }
            attr_accessor :reason

            sig { params(reason: String).returns(T.attached_class) }
            def self.new(
              # Reason for the post-transformation failure.
              reason:
            )
            end

            sig { override.returns({ reason: String }) }
            def to_hash
            end
          end
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::UploadPostTransformErrorEvent::Request,
              Imagekitio::Internal::AnyHash
            )
          end

        sig do
          returns(
            Imagekitio::UploadPostTransformErrorEvent::Request::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        # Unique identifier for the originating request.
        sig { returns(String) }
        attr_accessor :x_request_id

        sig do
          params(
            transformation:
              Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::OrHash,
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
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation,
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
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          # Type of the requested post-transformation.
          sig do
            returns(
              Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          sig do
            returns(
              T.nilable(
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol:
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol::OrSymbol
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
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::OrSymbol,
              protocol:
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol::OrSymbol,
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
                  Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol,
                protocol:
                  Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol,
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
                  Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TRANSFORMATION =
              T.let(
                :transformation,
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )
            ABS =
              T.let(
                :abs,
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )
            THUMBNAIL =
              T.let(
                :thumbnail,
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
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
                  Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HLS =
              T.let(
                :hls,
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            DASH =
              T.let(
                :dash,
                Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
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
