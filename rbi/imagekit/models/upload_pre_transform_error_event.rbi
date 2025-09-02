# typed: strong

module Imagekit
  module Models
    class UploadPreTransformErrorEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::UploadPreTransformErrorEvent,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekit::UploadPreTransformErrorEvent::Data) }
      attr_reader :data

      sig do
        params(data: Imagekit::UploadPreTransformErrorEvent::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Imagekit::UploadPreTransformErrorEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekit::UploadPreTransformErrorEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          created_at: Time,
          data: Imagekit::UploadPreTransformErrorEvent::Data::OrHash,
          request: Imagekit::UploadPreTransformErrorEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the event.
        id:,
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
            id: String,
            created_at: Time,
            data: Imagekit::UploadPreTransformErrorEvent::Data,
            request: Imagekit::UploadPreTransformErrorEvent::Request,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Data < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::UploadPreTransformErrorEvent::Data,
              Imagekit::Internal::AnyHash
            )
          end

        # Name of the file.
        sig { returns(String) }
        attr_accessor :name

        # Path of the file.
        sig { returns(String) }
        attr_accessor :path

        sig do
          returns(Imagekit::UploadPreTransformErrorEvent::Data::Transformation)
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::UploadPreTransformErrorEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            name: String,
            path: String,
            transformation:
              Imagekit::UploadPreTransformErrorEvent::Data::Transformation::OrHash
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
                Imagekit::UploadPreTransformErrorEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Transformation < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::UploadPreTransformErrorEvent::Data::Transformation,
                Imagekit::Internal::AnyHash
              )
            end

          sig do
            returns(
              Imagekit::UploadPreTransformErrorEvent::Data::Transformation::Error
            )
          end
          attr_reader :error

          sig do
            params(
              error:
                Imagekit::UploadPreTransformErrorEvent::Data::Transformation::Error::OrHash
            ).void
          end
          attr_writer :error

          sig do
            params(
              error:
                Imagekit::UploadPreTransformErrorEvent::Data::Transformation::Error::OrHash
            ).returns(T.attached_class)
          end
          def self.new(error:)
          end

          sig do
            override.returns(
              {
                error:
                  Imagekit::UploadPreTransformErrorEvent::Data::Transformation::Error
              }
            )
          end
          def to_hash
          end

          class Error < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::UploadPreTransformErrorEvent::Data::Transformation::Error,
                  Imagekit::Internal::AnyHash
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

      class Request < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::UploadPreTransformErrorEvent::Request,
              Imagekit::Internal::AnyHash
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
