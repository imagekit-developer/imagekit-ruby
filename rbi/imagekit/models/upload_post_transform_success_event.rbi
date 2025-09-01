# typed: strong

module Imagekit
  module Models
    class UploadPostTransformSuccessEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::UploadPostTransformSuccessEvent,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekit::UploadPostTransformSuccessEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekit::UploadPostTransformSuccessEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Imagekit::UploadPostTransformSuccessEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekit::UploadPostTransformSuccessEvent::Request::OrHash
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
          id: String,
          created_at: Time,
          data: Imagekit::UploadPostTransformSuccessEvent::Data::OrHash,
          request: Imagekit::UploadPostTransformSuccessEvent::Request::OrHash,
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
        type: :"upload.post-transform.success"
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            data: Imagekit::UploadPostTransformSuccessEvent::Data,
            request: Imagekit::UploadPostTransformSuccessEvent::Request,
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
              Imagekit::UploadPostTransformSuccessEvent::Data,
              Imagekit::Internal::AnyHash
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

      class Request < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::UploadPostTransformSuccessEvent::Request,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          returns(
            Imagekit::UploadPostTransformSuccessEvent::Request::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        # Unique identifier for the originating request.
        sig { returns(String) }
        attr_accessor :x_request_id

        sig do
          params(
            transformation:
              Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::OrHash,
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
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation,
              x_request_id: String
            }
          )
        end
        def to_hash
        end

        class Transformation < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation,
                Imagekit::Internal::AnyHash
              )
            end

          # Type of the requested post-transformation.
          sig do
            returns(
              Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          sig do
            returns(
              T.nilable(
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol:
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::OrSymbol
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
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::OrSymbol,
              protocol:
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::OrSymbol,
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
                  Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol,
                protocol:
                  Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol,
                value: String
              }
            )
          end
          def to_hash
          end

          # Type of the requested post-transformation.
          module Type
            extend Imagekit::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TRANSFORMATION =
              T.let(
                :transformation,
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )
            ABS =
              T.let(
                :abs,
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )
            THUMBNAIL =
              T.let(
                :thumbnail,
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          module Protocol
            extend Imagekit::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HLS =
              T.let(
                :hls,
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            DASH =
              T.let(
                :dash,
                Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::UploadPostTransformSuccessEvent::Request::Transformation::Protocol::TaggedSymbol
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
