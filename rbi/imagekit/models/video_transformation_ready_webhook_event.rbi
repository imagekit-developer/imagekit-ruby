# typed: strong

module Imagekit
  module Models
    class VideoTransformationReadyWebhookEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationReadyWebhookEvent,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekit::VideoTransformationReadyWebhookEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekit::VideoTransformationReadyWebhookEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Imagekit::VideoTransformationReadyWebhookEvent::Request) }
      attr_reader :request

      sig do
        params(
          request:
            Imagekit::VideoTransformationReadyWebhookEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig do
        returns(
          Imagekit::VideoTransformationReadyWebhookEvent::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      sig do
        returns(
          T.nilable(Imagekit::VideoTransformationReadyWebhookEvent::Timings)
        )
      end
      attr_reader :timings

      sig do
        params(
          timings:
            Imagekit::VideoTransformationReadyWebhookEvent::Timings::OrHash
        ).void
      end
      attr_writer :timings

      sig do
        params(
          id: String,
          created_at: Time,
          data: Imagekit::VideoTransformationReadyWebhookEvent::Data::OrHash,
          request:
            Imagekit::VideoTransformationReadyWebhookEvent::Request::OrHash,
          type: Imagekit::VideoTransformationReadyWebhookEvent::Type::OrSymbol,
          timings:
            Imagekit::VideoTransformationReadyWebhookEvent::Timings::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the event.
        id:,
        created_at:,
        data:,
        request:,
        type:,
        timings: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            data: Imagekit::VideoTransformationReadyWebhookEvent::Data,
            request: Imagekit::VideoTransformationReadyWebhookEvent::Request,
            type:
              Imagekit::VideoTransformationReadyWebhookEvent::Type::TaggedSymbol,
            timings: Imagekit::VideoTransformationReadyWebhookEvent::Timings
          }
        )
      end
      def to_hash
      end

      class Data < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::VideoTransformationReadyWebhookEvent::Data,
              Imagekit::Internal::AnyHash
            )
          end

        sig do
          returns(Imagekit::VideoTransformationReadyWebhookEvent::Data::Asset)
        end
        attr_reader :asset

        sig do
          params(
            asset:
              Imagekit::VideoTransformationReadyWebhookEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        sig do
          returns(
            Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset:
              Imagekit::VideoTransformationReadyWebhookEvent::Data::Asset::OrHash,
            transformation:
              Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(asset:, transformation:)
        end

        sig do
          override.returns(
            {
              asset:
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Asset,
              transformation:
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Asset,
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
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation,
                Imagekit::Internal::AnyHash
              )
            end

          sig do
            returns(
              Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            returns(
              T.nilable(
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          sig do
            returns(
              T.nilable(
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output
              )
            )
          end
          attr_reader :output

          sig do
            params(
              output:
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::OrHash
            ).void
          end
          attr_writer :output

          sig do
            params(
              type:
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type::OrSymbol,
              options:
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::OrHash,
              output:
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::OrHash
            ).returns(T.attached_class)
          end
          def self.new(type:, options: nil, output: nil)
          end

          sig do
            override.returns(
              {
                type:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type::TaggedSymbol,
                options:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options,
                output:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output
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
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIDEO_TRANSFORMATION =
              T.let(
                :"video-transformation",
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )
            VIDEO_THUMBNAIL =
              T.let(
                :"video-thumbnail",
                Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type::TaggedSymbol
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
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options,
                  Imagekit::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              )
            end
            attr_reader :audio_codec

            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec::OrSymbol
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
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              )
            end
            attr_reader :format_

            sig do
              params(
                format_:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::OrSymbol
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
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              )
            end
            attr_reader :stream_protocol

            sig do
              params(
                stream_protocol:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol::OrSymbol
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
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              )
            end
            attr_reader :video_codec

            sig do
              params(
                video_codec:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec::OrSymbol
              ).void
            end
            attr_writer :video_codec

            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec::OrSymbol,
                auto_rotate: T::Boolean,
                format_:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::OrSymbol,
                quality: Integer,
                stream_protocol:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol::OrSymbol,
                variants: T::Array[String],
                video_codec:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec::OrSymbol
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
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol,
                  auto_rotate: T::Boolean,
                  format_:
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol,
                  quality: Integer,
                  stream_protocol:
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol,
                  variants: T::Array[String],
                  video_codec:
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
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
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AAC =
                T.let(
                  :aac,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              OPUS =
                T.let(
                  :opus,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
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
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MP4 =
                T.let(
                  :mp4,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBM =
                T.let(
                  :webm,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              JPG =
                T.let(
                  :jpg,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              PNG =
                T.let(
                  :png,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBP =
                T.let(
                  :webp,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format::TaggedSymbol
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
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              HLS =
                T.let(
                  :HLS,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              DASH =
                T.let(
                  :DASH,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
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
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              H264 =
                T.let(
                  :h264,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              VP9 =
                T.let(
                  :vp9,
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Output < Imagekit::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output,
                  Imagekit::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :url

            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata
                )
              )
            end
            attr_reader :video_metadata

            sig do
              params(
                video_metadata:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata::OrHash
              ).void
            end
            attr_writer :video_metadata

            sig do
              params(
                url: String,
                video_metadata:
                  Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata::OrHash
              ).returns(T.attached_class)
            end
            def self.new(url:, video_metadata: nil)
            end

            sig do
              override.returns(
                {
                  url: String,
                  video_metadata:
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata
                }
              )
            end
            def to_hash
            end

            class VideoMetadata < Imagekit::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata,
                    Imagekit::Internal::AnyHash
                  )
                end

              sig { returns(Integer) }
              attr_accessor :bitrate

              sig { returns(Float) }
              attr_accessor :duration

              sig { returns(Integer) }
              attr_accessor :height

              sig { returns(Integer) }
              attr_accessor :width

              sig do
                params(
                  bitrate: Integer,
                  duration: Float,
                  height: Integer,
                  width: Integer
                ).returns(T.attached_class)
              end
              def self.new(bitrate:, duration:, height:, width:)
              end

              sig do
                override.returns(
                  {
                    bitrate: Integer,
                    duration: Float,
                    height: Integer,
                    width: Integer
                  }
                )
              end
              def to_hash
              end
            end
          end
        end
      end

      class Request < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::VideoTransformationReadyWebhookEvent::Request,
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
            T.all(Symbol, Imagekit::VideoTransformationReadyWebhookEvent::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VIDEO_TRANSFORMATION_READY =
          T.let(
            :"video.transformation.ready",
            Imagekit::VideoTransformationReadyWebhookEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::VideoTransformationReadyWebhookEvent::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Timings < Imagekit::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekit::VideoTransformationReadyWebhookEvent::Timings,
              Imagekit::Internal::AnyHash
            )
          end

        # Milliseconds spent downloading the source.
        sig { returns(T.nilable(Integer)) }
        attr_reader :download_duration

        sig { params(download_duration: Integer).void }
        attr_writer :download_duration

        # Milliseconds spent encoding.
        sig { returns(T.nilable(Integer)) }
        attr_reader :encoding_duration

        sig { params(encoding_duration: Integer).void }
        attr_writer :encoding_duration

        sig do
          params(
            download_duration: Integer,
            encoding_duration: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Milliseconds spent downloading the source.
          download_duration: nil,
          # Milliseconds spent encoding.
          encoding_duration: nil
        )
        end

        sig do
          override.returns(
            { download_duration: Integer, encoding_duration: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
