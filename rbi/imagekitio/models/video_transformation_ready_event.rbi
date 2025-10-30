# typed: strong

module Imagekitio
  module Models
    class VideoTransformationReadyEvent < Imagekitio::Models::BaseWebhookEvent
      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::VideoTransformationReadyEvent,
            Imagekitio::Internal::AnyHash
          )
        end

      # Timestamp when the event was created in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekitio::VideoTransformationReadyEvent::Data) }
      attr_reader :data

      sig do
        params(
          data: Imagekitio::VideoTransformationReadyEvent::Data::OrHash
        ).void
      end
      attr_writer :data

      # Information about the original request that triggered the video transformation.
      sig { returns(Imagekitio::VideoTransformationReadyEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekitio::VideoTransformationReadyEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      # Performance metrics for the transformation process.
      sig do
        returns(T.nilable(Imagekitio::VideoTransformationReadyEvent::Timings))
      end
      attr_reader :timings

      sig do
        params(
          timings: Imagekitio::VideoTransformationReadyEvent::Timings::OrHash
        ).void
      end
      attr_writer :timings

      # Triggered when video encoding is finished and the transformed resource is ready
      # to be served. This is the key event to listen for - update your database or CMS
      # flags when you receive this so your application can start showing the
      # transformed video to users.
      sig do
        params(
          created_at: Time,
          data: Imagekitio::VideoTransformationReadyEvent::Data::OrHash,
          request: Imagekitio::VideoTransformationReadyEvent::Request::OrHash,
          timings: Imagekitio::VideoTransformationReadyEvent::Timings::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Timestamp when the event was created in ISO8601 format.
        created_at:,
        data:,
        # Information about the original request that triggered the video transformation.
        request:,
        # Performance metrics for the transformation process.
        timings: nil,
        type: :"video.transformation.ready"
      )
      end

      sig do
        override.returns(
          {
            created_at: Time,
            data: Imagekitio::VideoTransformationReadyEvent::Data,
            request: Imagekitio::VideoTransformationReadyEvent::Request,
            type: Symbol,
            timings: Imagekitio::VideoTransformationReadyEvent::Timings
          }
        )
      end
      def to_hash
      end

      class Data < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::VideoTransformationReadyEvent::Data,
              Imagekitio::Internal::AnyHash
            )
          end

        # Information about the source video asset being transformed.
        sig { returns(Imagekitio::VideoTransformationReadyEvent::Data::Asset) }
        attr_reader :asset

        sig do
          params(
            asset:
              Imagekitio::VideoTransformationReadyEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        sig do
          returns(
            Imagekitio::VideoTransformationReadyEvent::Data::Transformation
          )
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekitio::VideoTransformationReadyEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset:
              Imagekitio::VideoTransformationReadyEvent::Data::Asset::OrHash,
            transformation:
              Imagekitio::VideoTransformationReadyEvent::Data::Transformation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Information about the source video asset being transformed.
          asset:,
          transformation:
        )
        end

        sig do
          override.returns(
            {
              asset: Imagekitio::VideoTransformationReadyEvent::Data::Asset,
              transformation:
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::VideoTransformationReadyEvent::Data::Asset,
                Imagekitio::Internal::AnyHash
              )
            end

          # URL to download or access the source video file.
          sig { returns(String) }
          attr_accessor :url

          # Information about the source video asset being transformed.
          sig { params(url: String).returns(T.attached_class) }
          def self.new(
            # URL to download or access the source video file.
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
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation,
                Imagekitio::Internal::AnyHash
              )
            end

          # Type of video transformation:
          #
          # - `video-transformation`: Standard video processing (resize, format conversion,
          #   etc.)
          # - `gif-to-video`: Convert animated GIF to video format
          # - `video-thumbnail`: Generate thumbnail image from video
          sig do
            returns(
              Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Configuration options for video transformations.
          sig do
            returns(
              T.nilable(
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          # Information about the transformed output video.
          sig do
            returns(
              T.nilable(
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output
              )
            )
          end
          attr_reader :output

          sig do
            params(
              output:
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output::OrHash
            ).void
          end
          attr_writer :output

          sig do
            params(
              type:
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type::OrSymbol,
              options:
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::OrHash,
              output:
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Type of video transformation:
            #
            # - `video-transformation`: Standard video processing (resize, format conversion,
            #   etc.)
            # - `gif-to-video`: Convert animated GIF to video format
            # - `video-thumbnail`: Generate thumbnail image from video
            type:,
            # Configuration options for video transformations.
            options: nil,
            # Information about the transformed output video.
            output: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol,
                options:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options,
                output:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output
              }
            )
          end
          def to_hash
          end

          # Type of video transformation:
          #
          # - `video-transformation`: Standard video processing (resize, format conversion,
          #   etc.)
          # - `gif-to-video`: Convert animated GIF to video format
          # - `video-thumbnail`: Generate thumbnail image from video
          module Type
            extend Imagekitio::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIDEO_TRANSFORMATION =
              T.let(
                :"video-transformation",
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
              )
            VIDEO_THUMBNAIL =
              T.let(
                :"video-thumbnail",
                Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Options < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Audio codec used for encoding (aac or opus).
            sig do
              returns(
                T.nilable(
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              )
            end
            attr_reader :audio_codec

            sig do
              params(
                audio_codec:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec::OrSymbol
              ).void
            end
            attr_writer :audio_codec

            # Whether to automatically rotate the video based on metadata.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :auto_rotate

            sig { params(auto_rotate: T::Boolean).void }
            attr_writer :auto_rotate

            # Output format for the transformed video or thumbnail.
            sig do
              returns(
                T.nilable(
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              )
            end
            attr_reader :format_

            sig do
              params(
                format_:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::OrSymbol
              ).void
            end
            attr_writer :format_

            # Quality setting for the output video.
            sig { returns(T.nilable(Integer)) }
            attr_reader :quality

            sig { params(quality: Integer).void }
            attr_writer :quality

            # Streaming protocol for adaptive bitrate streaming.
            sig do
              returns(
                T.nilable(
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              )
            end
            attr_reader :stream_protocol

            sig do
              params(
                stream_protocol:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol::OrSymbol
              ).void
            end
            attr_writer :stream_protocol

            # Array of quality representations for adaptive bitrate streaming.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :variants

            sig { params(variants: T::Array[String]).void }
            attr_writer :variants

            # Video codec used for encoding (h264, vp9, or av1).
            sig do
              returns(
                T.nilable(
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              )
            end
            attr_reader :video_codec

            sig do
              params(
                video_codec:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::OrSymbol
              ).void
            end
            attr_writer :video_codec

            # Configuration options for video transformations.
            sig do
              params(
                audio_codec:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec::OrSymbol,
                auto_rotate: T::Boolean,
                format_:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::OrSymbol,
                quality: Integer,
                stream_protocol:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol::OrSymbol,
                variants: T::Array[String],
                video_codec:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Audio codec used for encoding (aac or opus).
              audio_codec: nil,
              # Whether to automatically rotate the video based on metadata.
              auto_rotate: nil,
              # Output format for the transformed video or thumbnail.
              format_: nil,
              # Quality setting for the output video.
              quality: nil,
              # Streaming protocol for adaptive bitrate streaming.
              stream_protocol: nil,
              # Array of quality representations for adaptive bitrate streaming.
              variants: nil,
              # Video codec used for encoding (h264, vp9, or av1).
              video_codec: nil
            )
            end

            sig do
              override.returns(
                {
                  audio_codec:
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol,
                  auto_rotate: T::Boolean,
                  format_:
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol,
                  quality: Integer,
                  stream_protocol:
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol,
                  variants: T::Array[String],
                  video_codec:
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # Audio codec used for encoding (aac or opus).
            module AudioCodec
              extend Imagekitio::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AAC =
                T.let(
                  :aac,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              OPUS =
                T.let(
                  :opus,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Output format for the transformed video or thumbnail.
            module Format
              extend Imagekitio::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MP4 =
                T.let(
                  :mp4,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBM =
                T.let(
                  :webm,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              JPG =
                T.let(
                  :jpg,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              PNG =
                T.let(
                  :png,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBP =
                T.let(
                  :webp,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::Format::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Streaming protocol for adaptive bitrate streaming.
            module StreamProtocol
              extend Imagekitio::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              HLS =
                T.let(
                  :HLS,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              DASH =
                T.let(
                  :DASH,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Video codec used for encoding (h264, vp9, or av1).
            module VideoCodec
              extend Imagekitio::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              H264 =
                T.let(
                  :h264,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              VP9 =
                T.let(
                  :vp9,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              AV1 =
                T.let(
                  :av1,
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Output < Imagekitio::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL to access the transformed video.
            sig { returns(String) }
            attr_accessor :url

            # Metadata of the output video file.
            sig do
              returns(
                T.nilable(
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata
                )
              )
            end
            attr_reader :video_metadata

            sig do
              params(
                video_metadata:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata::OrHash
              ).void
            end
            attr_writer :video_metadata

            # Information about the transformed output video.
            sig do
              params(
                url: String,
                video_metadata:
                  Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # URL to access the transformed video.
              url:,
              # Metadata of the output video file.
              video_metadata: nil
            )
            end

            sig do
              override.returns(
                {
                  url: String,
                  video_metadata:
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata
                }
              )
            end
            def to_hash
            end

            class VideoMetadata < Imagekitio::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Imagekitio::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata,
                    Imagekitio::Internal::AnyHash
                  )
                end

              # Bitrate of the output video in bits per second.
              sig { returns(Integer) }
              attr_accessor :bitrate

              # Duration of the output video in seconds.
              sig { returns(Float) }
              attr_accessor :duration

              # Height of the output video in pixels.
              sig { returns(Integer) }
              attr_accessor :height

              # Width of the output video in pixels.
              sig { returns(Integer) }
              attr_accessor :width

              # Metadata of the output video file.
              sig do
                params(
                  bitrate: Integer,
                  duration: Float,
                  height: Integer,
                  width: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # Bitrate of the output video in bits per second.
                bitrate:,
                # Duration of the output video in seconds.
                duration:,
                # Height of the output video in pixels.
                height:,
                # Width of the output video in pixels.
                width:
              )
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

      class Request < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::VideoTransformationReadyEvent::Request,
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

        # Information about the original request that triggered the video transformation.
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

      class Timings < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::VideoTransformationReadyEvent::Timings,
              Imagekitio::Internal::AnyHash
            )
          end

        # Time spent downloading the source video from your origin or media library, in
        # milliseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :download_duration

        sig { params(download_duration: Integer).void }
        attr_writer :download_duration

        # Time spent encoding the video, in milliseconds.
        sig { returns(T.nilable(Integer)) }
        attr_reader :encoding_duration

        sig { params(encoding_duration: Integer).void }
        attr_writer :encoding_duration

        # Performance metrics for the transformation process.
        sig do
          params(
            download_duration: Integer,
            encoding_duration: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Time spent downloading the source video from your origin or media library, in
          # milliseconds.
          download_duration: nil,
          # Time spent encoding the video, in milliseconds.
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
