# typed: strong

module Imagekit
  module Models
    class VideoTransformationErrorWebhookEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationErrorWebhookEvent,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekit::VideoTransformationErrorWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekit::VideoTransformationErrorWebhookEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Imagekit::VideoTransformationErrorWebhookEvent::Request) }
      attr_reader :request

      sig do
        params(
          request:
            Imagekit::VideoTransformationErrorWebhookEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig do
        returns(
          Imagekit::VideoTransformationErrorWebhookEvent::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig do
        params(
          id: String,
          created_at: Time,
          data: Imagekit::VideoTransformationErrorWebhookEvent::Data::OrHash,
          request:
            Imagekit::VideoTransformationErrorWebhookEvent::Request::OrHash,
          type: Imagekit::VideoTransformationErrorWebhookEvent::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the event.
        id:,
        created_at:,
        data:,
        request:,
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            data: Imagekit::VideoTransformationErrorWebhookEvent::Data,
            request: Imagekit::VideoTransformationErrorWebhookEvent::Request,
            type:
              Imagekit::VideoTransformationErrorWebhookEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Data < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::VideoTransformationErrorWebhookEvent::Data,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          returns(Imagekit::VideoTransformationErrorWebhookEvent::Data::Asset)
        end
        attr_reader :asset

        sig do
          params(
            asset:
              Imagekit::VideoTransformationErrorWebhookEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        sig do
          returns(
            Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset:
              Imagekit::VideoTransformationErrorWebhookEvent::Data::Asset::OrHash,
            transformation:
              Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(asset:, transformation:)
        end

        sig do
          override.returns(
            {
              asset:
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Asset,
              transformation:
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Asset,
                Imagekit::Internal::AnyHash
              )
            end

          # Source asset URL.
          sig { returns(String) }
          attr_accessor :url

          sig { params(url: String).returns(T.attached_class) }
          def self.new(
            # Source asset URL.
            url:
          )
          end

          sig { override.returns({ url: String }) }
          def to_hash
          end
        end

        class Transformation < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation,
                Imagekit::Internal::AnyHash
              )
            end

          sig do
            returns(
              Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error
              )
            )
          end
          attr_reader :error

          sig do
            params(
              error:
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::OrHash
            ).void
          end
          attr_writer :error

          sig do
            returns(
              T.nilable(
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          sig do
            params(
              type:
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type::OrSymbol,
              error:
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::OrHash,
              options:
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::OrHash
            ).returns(T.attached_class)
          end
          def self.new(type:, error: nil, options: nil)
          end

          sig do
            override.returns(
              {
                type:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type::TaggedSymbol,
                error:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error,
                options:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options
              }
            )
          end
          def to_hash
          end

          module Type
            extend Imagekit::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIDEO_TRANSFORMATION =
              T.let(
                :"video-transformation",
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )
            VIDEO_THUMBNAIL =
              T.let(
                :"video-thumbnail",
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Error < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error,
                  Imagekit::Internal::AnyHash
                )
              end

            sig do
              returns(
                Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason::TaggedSymbol
              )
            end
            attr_accessor :reason

            sig do
              params(
                reason:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(reason:)
            end

            sig do
              override.returns(
                {
                  reason:
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            module Reason
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ENCODING_FAILED =
                T.let(
                  :encoding_failed,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )
              DOWNLOAD_FAILED =
                T.let(
                  :download_failed,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )
              INTERNAL_SERVER_ERROR =
                T.let(
                  :internal_server_error,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Error::Reason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Options < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options,
                  Imagekit::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              )
            end
            attr_reader :audio_codec

            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec::OrSymbol
              ).void
            end
            attr_writer :audio_codec

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :auto_rotate

            sig { params(auto_rotate: T::Boolean).void }
            attr_writer :auto_rotate

            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              )
            end
            attr_reader :format_

            sig do
              params(
                format_:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::OrSymbol
              ).void
            end
            attr_writer :format_

            sig { returns(T.nilable(Integer)) }
            attr_reader :quality

            sig { params(quality: Integer).void }
            attr_writer :quality

            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              )
            end
            attr_reader :stream_protocol

            sig do
              params(
                stream_protocol:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol::OrSymbol
              ).void
            end
            attr_writer :stream_protocol

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :variants

            sig { params(variants: T::Array[String]).void }
            attr_writer :variants

            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              )
            end
            attr_reader :video_codec

            sig do
              params(
                video_codec:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec::OrSymbol
              ).void
            end
            attr_writer :video_codec

            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec::OrSymbol,
                auto_rotate: T::Boolean,
                format_:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::OrSymbol,
                quality: Integer,
                stream_protocol:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol::OrSymbol,
                variants: T::Array[String],
                video_codec:
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              audio_codec: nil,
              auto_rotate: nil,
              format_: nil,
              quality: nil,
              stream_protocol: nil,
              variants: nil,
              video_codec: nil
            )
            end

            sig do
              override.returns(
                {
                  audio_codec:
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol,
                  auto_rotate: T::Boolean,
                  format_:
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol,
                  quality: Integer,
                  stream_protocol:
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol,
                  variants: T::Array[String],
                  video_codec:
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            module AudioCodec
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AAC =
                T.let(
                  :aac,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              OPUS =
                T.let(
                  :opus,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module Format
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MP4 =
                T.let(
                  :mp4,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBM =
                T.let(
                  :webm,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              JPG =
                T.let(
                  :jpg,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              PNG =
                T.let(
                  :png,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBP =
                T.let(
                  :webp,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module StreamProtocol
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              HLS =
                T.let(
                  :HLS,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              DASH =
                T.let(
                  :DASH,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module VideoCodec
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              H264 =
                T.let(
                  :h264,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              VP9 =
                T.let(
                  :vp9,
                  Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end

      class Request < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::VideoTransformationErrorWebhookEvent::Request,
              Imagekit::Internal::AnyHash
            )
          end

        # URL of the submitted request.
        sig { returns(String) }
        attr_accessor :url

        # Unique ID for the originating request.
        sig { returns(String) }
        attr_accessor :x_request_id

        # User-Agent header of the originating request.
        sig { returns(T.nilable(String)) }
        attr_reader :user_agent

        sig { params(user_agent: String).void }
        attr_writer :user_agent

        sig do
          params(url: String, x_request_id: String, user_agent: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # URL of the submitted request.
          url:,
          # Unique ID for the originating request.
          x_request_id:,
          # User-Agent header of the originating request.
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

      module Type
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Imagekit::VideoTransformationErrorWebhookEvent::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VIDEO_TRANSFORMATION_ERROR =
          T.let(
            :"video.transformation.error",
            Imagekit::VideoTransformationErrorWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::VideoTransformationErrorWebhookEvent::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
