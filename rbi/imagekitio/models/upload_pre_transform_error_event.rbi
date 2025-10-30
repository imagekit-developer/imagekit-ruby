# typed: strong

module Imagekitio
  module Models
    class UploadPreTransformErrorEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::UploadPreTransformErrorEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::UploadPreTransformErrorEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::UploadPreTransformErrorEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Imagekitio::UploadPreTransformErrorEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekitio::UploadPreTransformErrorEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a pre-transformation fails. The file upload may have been
      # accepted, but the requested transformation could not be applied.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::UploadPreTransformErrorEvent::Data::OrHash,
          request: Imagekitio::UploadPreTransformErrorEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp of when the event occurred in ISO8601 format.
        created_at:,
        data:,
        request:,
        type: :"upload.pre-transform.error"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::UploadPreTransformErrorEvent::Data,
            request: Imagekitio::UploadPreTransformErrorEvent::Request,
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
              Imagekitio::UploadPreTransformErrorEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # Name of the file.
        sig { returns(String) }
        attr_accessor :name

        # Path of the file.
        sig { returns(String) }
        attr_accessor :path

        sig do
          returns(
            Imagekitio::UploadPreTransformErrorEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            name: String,
            path: String,
            transformation:
              Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Name of the file.
          name:,
          # Path of the file.
          path:,
          transformation:
        )
        end

        sig do
          override.returns(
            {
              name: String,
              path: String,
              transformation:
                Imagekitio::UploadPreTransformErrorEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Transformation < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::UploadPreTransformErrorEvent::Data::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          sig do
            returns(
              Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::Error
            )
          end
          attr_reader :error

          sig do
            params(
              error:
                Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::Error::OrHash
            ).void
          end
          attr_writer :error

          sig do
            params(
              error:
                Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::Error::OrHash
            ).returns(T.attached_class)
          end
          def self.new(error:)
          end

          sig do
            override.returns(
              {
                error:
                  Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::Error
              }
            )
          end
          def to_hash
          end

          class Error < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::UploadPreTransformErrorEvent::Data::Transformation::Error,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Reason for the pre-transformation failure.
            sig { returns(String) }
            attr_accessor :reason

            sig { params(reason: String).returns(T.attached_class) }
            def self.new(
              # Reason for the pre-transformation failure.
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
              Imagekitio::UploadPreTransformErrorEvent::Request,
              Imagekitio::Internal::AnyHash
            )
          end

        # The requested pre-transformation string.
        sig { returns(String) }
        attr_accessor :transformation

        # Unique identifier for the originating request.
        sig { returns(String) }
        attr_accessor :x_request_id

        sig do
          params(transformation: String, x_request_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The requested pre-transformation string.
          transformation:,
          # Unique identifier for the originating request.
          x_request_id:
        )
        end

        sig do
          override.returns({ transformation: String, x_request_id: String })
        end
        def to_hash
        end
      end
    end
  end
end
