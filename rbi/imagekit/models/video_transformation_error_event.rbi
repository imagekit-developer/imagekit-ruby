# typed: strong

module Imagekit
  module Models
    class VideoTransformationErrorEvent < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Imagekit::VideoTransformationErrorEvent,
            Imagekit::Internal::AnyHash
          )
        end

      # Unique identifier for the event.
      sig { returns(String) }
      attr_accessor :id

      # Timestamp when the event was created in ISO8601 format.
      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Imagekit::VideoTransformationErrorEvent::Data) }
      attr_reader :data

      sig do
        params(data: Imagekit::VideoTransformationErrorEvent::Data::OrHash).void
      end
      attr_writer :data

      # Information about the original request that triggered the video transformation.
      sig { returns(Imagekit::VideoTransformationErrorEvent::Request) }
      attr_reader :request

      sig do
        params(
          request: Imagekit::VideoTransformationErrorEvent::Request::OrHash
        ).void
      end
      attr_writer :request

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          created_at: Time,
          data: Imagekit::VideoTransformationErrorEvent::Data::OrHash,
          request: Imagekit::VideoTransformationErrorEvent::Request::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the event.
        id:,
        # Timestamp when the event was created in ISO8601 format.
        created_at:,
        data:,
        # Information about the original request that triggered the video transformation.
        request:,
        type: :"video.transformation.error"
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            data: Imagekit::VideoTransformationErrorEvent::Data,
            request: Imagekit::VideoTransformationErrorEvent::Request,
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
              Imagekit::VideoTransformationErrorEvent::Data,
              Imagekit::Internal::AnyHash
            )
          end

        # Information about the source video asset being transformed.
        sig { returns(Imagekit::VideoTransformationErrorEvent::Data::Asset) }
        attr_reader :asset

        sig do
          params(
            asset: Imagekit::VideoTransformationErrorEvent::Data::Asset::OrHash
          ).void
        end
        attr_writer :asset

        sig do
          returns(Imagekit::VideoTransformationErrorEvent::Data::Transformation)
        end
        attr_reader :transformation

        sig do
          params(
            transformation:
              Imagekit::VideoTransformationErrorEvent::Data::Transformation::OrHash
          ).void
        end
        attr_writer :transformation

        sig do
          params(
            asset: Imagekit::VideoTransformationErrorEvent::Data::Asset::OrHash,
            transformation:
              Imagekit::VideoTransformationErrorEvent::Data::Transformation::OrHash
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
              asset: Imagekit::VideoTransformationErrorEvent::Data::Asset,
              transformation:
                Imagekit::VideoTransformationErrorEvent::Data::Transformation
            }
          )
        end
        def to_hash
        end

        class Asset < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::VideoTransformationErrorEvent::Data::Asset,
                Imagekit::Internal::AnyHash
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

        class Transformation < Imagekit::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekit::VideoTransformationErrorEvent::Data::Transformation,
                Imagekit::Internal::AnyHash
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
              Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Details about the transformation error.
          sig do
            returns(
              T.nilable(
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error
              )
            )
          end
          attr_reader :error

          sig do
            params(
              error:
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::OrHash
            ).void
          end
          attr_writer :error

          # Configuration options for video transformations.
          sig do
            returns(
              T.nilable(
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options
              )
            )
          end
          attr_reader :options

          sig do
            params(
              options:
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::OrHash
            ).void
          end
          attr_writer :options

          sig do
            params(
              type:
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type::OrSymbol,
              error:
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::OrHash,
              options:
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::OrHash
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
            # Details about the transformation error.
            error: nil,
            # Configuration options for video transformations.
            options: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol,
                error:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error,
                options:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options
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
            extend Imagekit::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VIDEO_TRANSFORMATION =
              T.let(
                :"video-transformation",
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
              )
            GIF_TO_VIDEO =
              T.let(
                :"gif-to-video",
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
              )
            VIDEO_THUMBNAIL =
              T.let(
                :"video-thumbnail",
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type::TaggedSymbol
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
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error,
                  Imagekit::Internal::AnyHash
                )
              end

            # Specific reason for the transformation failure:
            #
            # - `encoding_failed`: Error during video encoding process
            # - `download_failed`: Could not download source video
            # - `internal_server_error`: Unexpected server error
            sig do
              returns(
                Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
              )
            end
            attr_accessor :reason

            # Details about the transformation error.
            sig do
              params(
                reason:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Specific reason for the transformation failure:
              #
              # - `encoding_failed`: Error during video encoding process
              # - `download_failed`: Could not download source video
              # - `internal_server_error`: Unexpected server error
              reason:
            )
            end

            sig do
              override.returns(
                {
                  reason:
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # Specific reason for the transformation failure:
            #
            # - `encoding_failed`: Error during video encoding process
            # - `download_failed`: Could not download source video
            # - `internal_server_error`: Unexpected server error
            module Reason
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ENCODING_FAILED =
                T.let(
                  :encoding_failed,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )
              DOWNLOAD_FAILED =
                T.let(
                  :download_failed,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )
              INTERNAL_SERVER_ERROR =
                T.let(
                  :internal_server_error,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason::TaggedSymbol
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
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options,
                  Imagekit::Internal::AnyHash
                )
              end

            # Audio codec used for encoding (aac or opus).
            sig do
              returns(
                T.nilable(
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              )
            end
            attr_reader :audio_codec

            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec::OrSymbol
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
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              )
            end
            attr_reader :format_

            sig do
              params(
                format_:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::OrSymbol
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
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              )
            end
            attr_reader :stream_protocol

            sig do
              params(
                stream_protocol:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol::OrSymbol
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
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              )
            end
            attr_reader :video_codec

            sig do
              params(
                video_codec:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::OrSymbol
              ).void
            end
            attr_writer :video_codec

            # Configuration options for video transformations.
            sig do
              params(
                audio_codec:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec::OrSymbol,
                auto_rotate: T::Boolean,
                format_:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::OrSymbol,
                quality: Integer,
                stream_protocol:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol::OrSymbol,
                variants: T::Array[String],
                video_codec:
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::OrSymbol
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
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol,
                  auto_rotate: T::Boolean,
                  format_:
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol,
                  quality: Integer,
                  stream_protocol:
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol,
                  variants: T::Array[String],
                  video_codec:
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # Audio codec used for encoding (aac or opus).
            module AudioCodec
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AAC =
                T.let(
                  :aac,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )
              OPUS =
                T.let(
                  :opus,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Output format for the transformed video or thumbnail.
            module Format
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MP4 =
                T.let(
                  :mp4,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBM =
                T.let(
                  :webm,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              JPG =
                T.let(
                  :jpg,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              PNG =
                T.let(
                  :png,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol
                )
              WEBP =
                T.let(
                  :webp,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Streaming protocol for adaptive bitrate streaming.
            module StreamProtocol
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              HLS =
                T.let(
                  :HLS,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )
              DASH =
                T.let(
                  :DASH,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Video codec used for encoding (h264, vp9, or av1).
            module VideoCodec
              extend Imagekit::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              H264 =
                T.let(
                  :h264,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              VP9 =
                T.let(
                  :vp9,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )
              AV1 =
                T.let(
                  :av1,
                  Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec::TaggedSymbol
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
              Imagekit::VideoTransformationErrorEvent::Request,
              Imagekit::Internal::AnyHash
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
    end
  end
end
