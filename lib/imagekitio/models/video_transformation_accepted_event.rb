# frozen_string_literal: true

module Imagekitio
  module Models
    class VideoTransformationAcceptedEvent < Imagekitio::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp when the event was created in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekitio::Models::VideoTransformationAcceptedEvent::Data]
      required :data, -> { Imagekitio::VideoTransformationAcceptedEvent::Data }

      # @!attribute request
      #   Information about the original request that triggered the video transformation.
      #
      #   @return [Imagekitio::Models::VideoTransformationAcceptedEvent::Request]
      required :request, -> { Imagekitio::VideoTransformationAcceptedEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"video.transformation.accepted"]
      required :type, const: :"video.transformation.accepted"

      # @!method initialize(created_at:, data:, request:, type: :"video.transformation.accepted")
      #   Triggered when a new video transformation request is accepted for processing.
      #   This event confirms that ImageKit has received and queued your transformation
      #   request. Use this for debugging and tracking transformation lifecycle.
      #
      #   @param created_at [Time] Timestamp when the event was created in ISO8601 format.
      #
      #   @param data [Imagekitio::Models::VideoTransformationAcceptedEvent::Data]
      #
      #   @param request [Imagekitio::Models::VideoTransformationAcceptedEvent::Request] Information about the original request that triggered the video transformation.
      #
      #   @param type [Symbol, :"video.transformation.accepted"]

      class Data < Imagekitio::Internal::Type::BaseModel
        # @!attribute asset
        #   Information about the source video asset being transformed.
        #
        #   @return [Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Asset]
        required :asset, -> { Imagekitio::VideoTransformationAcceptedEvent::Data::Asset }

        # @!attribute transformation
        #   Base information about a video transformation request.
        #
        #   @return [Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation]
        required :transformation, -> { Imagekitio::VideoTransformationAcceptedEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Asset] Information about the source video asset being transformed.
        #
        #   @param transformation [Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation] Base information about a video transformation request.

        # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data#asset
        class Asset < Imagekitio::Internal::Type::BaseModel
          # @!attribute url
          #   URL to download or access the source video file.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:)
          #   Information about the source video asset being transformed.
          #
          #   @param url [String] URL to download or access the source video file.
        end

        # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data#transformation
        class Transformation < Imagekitio::Internal::Type::BaseModel
          # @!attribute type
          #   Type of video transformation:
          #
          #   - `video-transformation`: Standard video processing (resize, format conversion,
          #     etc.)
          #   - `gif-to-video`: Convert animated GIF to video format
          #   - `video-thumbnail`: Generate thumbnail image from video
          #
          #   @return [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekitio::VideoTransformationAcceptedEvent::Data::Transformation::Type }

          # @!attribute options
          #   Configuration options for video transformations.
          #
          #   @return [Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekitio::VideoTransformationAcceptedEvent::Data::Transformation::Options }

          # @!method initialize(type:, options: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation} for
          #   more details.
          #
          #   Base information about a video transformation request.
          #
          #   @param type [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Type] Type of video transformation:
          #
          #   @param options [Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options] Configuration options for video transformations.

          # Type of video transformation:
          #
          # - `video-transformation`: Standard video processing (resize, format conversion,
          #   etc.)
          # - `gif-to-video`: Convert animated GIF to video format
          # - `video-thumbnail`: Generate thumbnail image from video
          #
          # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation#type
          module Type
            extend Imagekitio::Internal::Type::Enum

            VIDEO_TRANSFORMATION = :"video-transformation"
            GIF_TO_VIDEO = :"gif-to-video"
            VIDEO_THUMBNAIL = :"video-thumbnail"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation#options
          class Options < Imagekitio::Internal::Type::BaseModel
            # @!attribute audio_codec
            #   Audio codec used for encoding (aac or opus).
            #
            #   @return [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::AudioCodec, nil]
            optional :audio_codec,
                     enum: -> { Imagekitio::VideoTransformationAcceptedEvent::Data::Transformation::Options::AudioCodec }

            # @!attribute auto_rotate
            #   Whether to automatically rotate the video based on metadata.
            #
            #   @return [Boolean, nil]
            optional :auto_rotate, Imagekitio::Internal::Type::Boolean

            # @!attribute format_
            #   Output format for the transformed video or thumbnail.
            #
            #   @return [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::Format, nil]
            optional :format_,
                     enum: -> {
                       Imagekitio::VideoTransformationAcceptedEvent::Data::Transformation::Options::Format
                     },
                     api_name: :format

            # @!attribute quality
            #   Quality setting for the output video.
            #
            #   @return [Integer, nil]
            optional :quality, Integer

            # @!attribute stream_protocol
            #   Streaming protocol for adaptive bitrate streaming.
            #
            #   @return [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::StreamProtocol, nil]
            optional :stream_protocol,
                     enum: -> { Imagekitio::VideoTransformationAcceptedEvent::Data::Transformation::Options::StreamProtocol }

            # @!attribute variants
            #   Array of quality representations for adaptive bitrate streaming.
            #
            #   @return [Array<String>, nil]
            optional :variants, Imagekitio::Internal::Type::ArrayOf[String]

            # @!attribute video_codec
            #   Video codec used for encoding (h264, vp9, or av1).
            #
            #   @return [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::VideoCodec, nil]
            optional :video_codec,
                     enum: -> { Imagekitio::VideoTransformationAcceptedEvent::Data::Transformation::Options::VideoCodec }

            # @!method initialize(audio_codec: nil, auto_rotate: nil, format_: nil, quality: nil, stream_protocol: nil, variants: nil, video_codec: nil)
            #   Configuration options for video transformations.
            #
            #   @param audio_codec [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::AudioCodec] Audio codec used for encoding (aac or opus).
            #
            #   @param auto_rotate [Boolean] Whether to automatically rotate the video based on metadata.
            #
            #   @param format_ [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::Format] Output format for the transformed video or thumbnail.
            #
            #   @param quality [Integer] Quality setting for the output video.
            #
            #   @param stream_protocol [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::StreamProtocol] Streaming protocol for adaptive bitrate streaming.
            #
            #   @param variants [Array<String>] Array of quality representations for adaptive bitrate streaming.
            #
            #   @param video_codec [Symbol, Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options::VideoCodec] Video codec used for encoding (h264, vp9, or av1).

            # Audio codec used for encoding (aac or opus).
            #
            # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options#audio_codec
            module AudioCodec
              extend Imagekitio::Internal::Type::Enum

              AAC = :aac
              OPUS = :opus

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Output format for the transformed video or thumbnail.
            #
            # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options#format_
            module Format
              extend Imagekitio::Internal::Type::Enum

              MP4 = :mp4
              WEBM = :webm
              JPG = :jpg
              PNG = :png
              WEBP = :webp

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Streaming protocol for adaptive bitrate streaming.
            #
            # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options#stream_protocol
            module StreamProtocol
              extend Imagekitio::Internal::Type::Enum

              HLS = :HLS
              DASH = :DASH

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Video codec used for encoding (h264, vp9, or av1).
            #
            # @see Imagekitio::Models::VideoTransformationAcceptedEvent::Data::Transformation::Options#video_codec
            module VideoCodec
              extend Imagekitio::Internal::Type::Enum

              H264 = :h264
              VP9 = :vp9
              AV1 = :av1

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      class Request < Imagekitio::Internal::Type::BaseModel
        # @!attribute url
        #   Full URL of the transformation request that was submitted.
        #
        #   @return [String]
        required :url, String

        # @!attribute x_request_id
        #   Unique identifier for the originating transformation request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!attribute user_agent
        #   User-Agent header from the original request that triggered the transformation.
        #
        #   @return [String, nil]
        optional :user_agent, String

        # @!method initialize(url:, x_request_id:, user_agent: nil)
        #   Information about the original request that triggered the video transformation.
        #
        #   @param url [String] Full URL of the transformation request that was submitted.
        #
        #   @param x_request_id [String] Unique identifier for the originating transformation request.
        #
        #   @param user_agent [String] User-Agent header from the original request that triggered the transformation.
      end
    end
  end
end
