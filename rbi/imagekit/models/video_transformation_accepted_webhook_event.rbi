# typed: strong

module Imagekit
  module Models
    class VideoTransformationAcceptedWebhookEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationAcceptedWebhookEvent,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekit::VideoTransformationAcceptedWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekit::VideoTransformationAcceptedWebhookEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig do
        returns(Imagekit::VideoTransformationAcceptedWebhookEvent::Request)
      end
      attr_reader :request

      sig do
        params(
          request:
            Imagekit::VideoTransformationAcceptedWebhookEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig do
        returns(
          Imagekit::VideoTransformationAcceptedWebhookEvent::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig do
        params(
          id: String,
          created_at: Time,
          data: Imagekit::VideoTransformationAcceptedWebhookEvent::Data::OrHash,
          request:
            Imagekit::VideoTransformationAcceptedWebhookEvent::Request::OrHash,
          type:
            Imagekit::VideoTransformationAcceptedWebhookEvent::Type::OrSymbol
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
            data: Imagekit::VideoTransformationAcceptedWebhookEvent::Data,
            request: Imagekit::VideoTransformationAcceptedWebhookEvent::Request,
            type:
              Imagekit::VideoTransformationAcceptedWebhookEvent::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Data < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::VideoTransformationAcceptedWebhookEvent::Data,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          returns(
            Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Asset
          )
        end
        attr_reader :asset

        sig do
          params(
            asset:
              Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        sig do
          returns(
            Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset:
              Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Asset::OrHash,
            transformation:
              Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(asset:, transformation:)
        end

        sig do
          override.returns(
            {
              asset:
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Asset,
              transformation:
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Asset,
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
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation,
                Imagekit::Internal::AnyHash
              )
            end

          sig do
            returns(
              Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          sig do
            params(
              type:
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type::OrSymbol,
              options:
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::OrHash
            ).returns(T.attached_class)
          end
          def self.new(type:, options: nil)
          end

          sig do
            override.returns(
              {
                type:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type::TaggedSymbol,
                options:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options
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
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIDEO_TRANSFORMATION =
              T.let(
                :"video-transformation",
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )
            VIDEO_THUMBNAIL =
              T.let(
                :"video-thumbnail",
                Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Options < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options,
                  Imagekit::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              )
            end
            attr_reader :audio_codec

            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec::OrSymbol
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
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              )
            end
            attr_reader :format_

            sig do
              params(
                format_:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::OrSymbol
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
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              )
            end
            attr_reader :stream_protocol

            sig do
              params(
                stream_protocol:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol::OrSymbol
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
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              )
            end
            attr_reader :video_codec

            sig do
              params(
                video_codec:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec::OrSymbol
              ).void
            end
            attr_writer :video_codec

            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec::OrSymbol,
                auto_rotate: T::Boolean,
                format_:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::OrSymbol,
                quality: Integer,
                stream_protocol:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol::OrSymbol,
                variants: T::Array[String],
                video_codec:
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec::OrSymbol
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
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol,
                  auto_rotate: T::Boolean,
                  format_:
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol,
                  quality: Integer,
                  stream_protocol:
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol,
                  variants: T::Array[String],
                  video_codec:
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
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
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AAC =
                T.let(
                  :aac,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              OPUS =
                T.let(
                  :opus,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
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
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MP4 =
                T.let(
                  :mp4,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBM =
                T.let(
                  :webm,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              JPG =
                T.let(
                  :jpg,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              PNG =
                T.let(
                  :png,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBP =
                T.let(
                  :webp,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
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
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              HLS =
                T.let(
                  :HLS,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              DASH =
                T.let(
                  :DASH,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
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
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              H264 =
                T.let(
                  :h264,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              VP9 =
                T.let(
                  :vp9,
                  Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
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
              Imagekit::VideoTransformationAcceptedWebhookEvent::Request,
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
            T.all(
              Symbol,
              Imagekit::VideoTransformationAcceptedWebhookEvent::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VIDEO_TRANSFORMATION_ACCEPTED =
          T.let(
            :"video.transformation.accepted",
            Imagekit::VideoTransformationAcceptedWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::VideoTransformationAcceptedWebhookEvent::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
