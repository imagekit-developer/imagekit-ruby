# typed: strong

module Imagekit
  module Models
    class UploadPostTransformErrorEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::UploadPostTransformErrorEvent,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      # Timestamp of when the event occurred in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekit::UploadPostTransformErrorEvent::Data) }
      attr_reader :data

      sig do
        params(data: Imagekit::UploadPostTransformErrorEvent::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Imagekit::UploadPostTransformErrorEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekit::UploadPostTransformErrorEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Triggered when a post-transformation fails. The original file remains available,
      # but the requested transformation could not be generated.
      sig do
        params(
          id: String,
          created_at: Time,
          data: Imagekit::UploadPostTransformErrorEvent::Data::OrHash,
          request: Imagekit::UploadPostTransformErrorEvent::Request::OrHash,
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
        type: :"upload.post-transform.error"
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            data: Imagekit::UploadPostTransformErrorEvent::Data,
            request: Imagekit::UploadPostTransformErrorEvent::Request,
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
              Imagekit::UploadPostTransformErrorEvent::Data,
              Imagekit::Internal::AnyHash
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
          returns(Imagekit::UploadPostTransformErrorEvent::Data::Transformation)
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::UploadPostTransformErrorEvent::Data::Transformation::OrHash
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
              Imagekit::UploadPostTransformErrorEvent::Data::Transformation::OrHash,
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
                Imagekit::UploadPostTransformErrorEvent::Data::Transformation,
              url: String
            }
          )
        end
        def to_hash
        end

        class Transformation < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::UploadPostTransformErrorEvent::Data::Transformation,
                Imagekit::Internal::AnyHash
              )
            end

          sig do
            returns(
              Imagekit::UploadPostTransformErrorEvent::Data::Transformation::Error
            )
          end
          attr_reader :error

          sig do
            params(
              error:
                Imagekit::UploadPostTransformErrorEvent::Data::Transformation::Error::OrHash
            ).void
          end
          attr_writer :error

          sig do
            params(
              error:
                Imagekit::UploadPostTransformErrorEvent::Data::Transformation::Error::OrHash
            ).returns(T.attached_class)
          end
          def self.new(error:)
          end

          sig do
            override.returns(
              {
                error:
                  Imagekit::UploadPostTransformErrorEvent::Data::Transformation::Error
              }
            )
          end
          def to_hash
          end

          class Error < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::UploadPostTransformErrorEvent::Data::Transformation::Error,
                  Imagekit::Internal::AnyHash
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

      class Request < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::UploadPostTransformErrorEvent::Request,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          returns(
            Imagekit::UploadPostTransformErrorEvent::Request::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::UploadPostTransformErrorEvent::Request::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        # Unique identifier for the originating request.
        sig { returns(String) }
        attr_accessor :x_request_id

        sig do
          params(
            transformation:
              Imagekit::UploadPostTransformErrorEvent::Request::Transformation::OrHash,
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
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation,
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
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation,
                Imagekit::Internal::AnyHash
              )
            end

          # Type of the requested post-transformation.
          sig do
            returns(
              Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Only applicable if transformation type is 'abs'. Streaming protocol used.
          sig do
            returns(
              T.nilable(
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            )
          end
          attr_reader :protocol

          sig do
            params(
              protocol:
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol::OrSymbol
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
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::OrSymbol,
              protocol:
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol::OrSymbol,
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
                  Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol,
                protocol:
                  Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol,
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
                  Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TRANSFORMATION =
              T.let(
                :transformation,
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )
            ABS =
              T.let(
                :abs,
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )
            THUMBNAIL =
              T.let(
                :thumbnail,
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Type::TaggedSymbol
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
                  Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HLS =
              T.let(
                :hls,
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
              )
            DASH =
              T.let(
                :dash,
                Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::UploadPostTransformErrorEvent::Request::Transformation::Protocol::TaggedSymbol
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
