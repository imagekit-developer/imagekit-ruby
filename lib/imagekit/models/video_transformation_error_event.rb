# frozen_string_literal: true

module Imagekit
  module Models
    class VideoTransformationErrorEvent < Imagekit::Models::BaseWebhookEvent
      # @!attribute created_at
      #   Timestamp when the event was created in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data]
      required :data, -> { Imagekit::VideoTransformationErrorEvent::Data }

      # @!attribute request
      #   Information about the original request that triggered the video transformation.
      #
      #   @return [Imagekit::Models::VideoTransformationErrorEvent::Request]
      required :request, -> { Imagekit::VideoTransformationErrorEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"video.transformation.error"]
      required :type, const: :"video.transformation.error"

      # @!method initialize(created_at:, data:, request:, type: :"video.transformation.error")
      #   Triggered when an error occurs during video encoding. Listen to this webhook to
      #   log error reasons and debug issues. Check your origin and URL endpoint settings
      #   if the reason is related to download failure. For other errors, contact ImageKit
      #   support.
      #
      #   @param created_at [Time] Timestamp when the event was created in ISO8601 format.
      #
      #   @param data [Imagekit::Models::VideoTransformationErrorEvent::Data]
      #
      #   @param request [Imagekit::Models::VideoTransformationErrorEvent::Request] Information about the original request that triggered the video transformation.
      #
      #   @param type [Symbol, :"video.transformation.error"]

      class Data < Imagekit::Internal::Type::BaseModel
        # @!attribute asset
        #   Information about the source video asset being transformed.
        #
        #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Asset]
        required :asset, -> { Imagekit::VideoTransformationErrorEvent::Data::Asset }

        # @!attribute transformation
        #
        #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation]
        required :transformation, -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekit::Models::VideoTransformationErrorEvent::Data::Asset] Information about the source video asset being transformed.
        #
        #   @param transformation [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation]

        # @see Imagekit::Models::VideoTransformationErrorEvent::Data#asset
        class Asset < Imagekit::Internal::Type::BaseModel
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

        # @see Imagekit::Models::VideoTransformationErrorEvent::Data#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute type
          #   Type of video transformation:
          #
          #   - `video-transformation`: Standard video processing (resize, format conversion,
          #     etc.)
          #   - `gif-to-video`: Convert animated GIF to video format
          #   - `video-thumbnail`: Generate thumbnail image from video
          #
          #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type }

          # @!attribute error
          #   Details about the transformation error.
          #
          #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error, nil]
          optional :error, -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error }

          # @!attribute options
          #   Configuration options for video transformations.
          #
          #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options }

          # @!method initialize(type:, error: nil, options: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation} for more
          #   details.
          #
          #   @param type [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Type] Type of video transformation:
          #
          #   @param error [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error] Details about the transformation error.
          #
          #   @param options [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options] Configuration options for video transformations.

          # Type of video transformation:
          #
          # - `video-transformation`: Standard video processing (resize, format conversion,
          #   etc.)
          # - `gif-to-video`: Convert animated GIF to video format
          # - `video-thumbnail`: Generate thumbnail image from video
          #
          # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation#type
          module Type
            extend Imagekit::Internal::Type::Enum

            VIDEO_TRANSFORMATION = :"video-transformation"
            GIF_TO_VIDEO = :"gif-to-video"
            VIDEO_THUMBNAIL = :"video-thumbnail"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation#error
          class Error < Imagekit::Internal::Type::BaseModel
            # @!attribute reason
            #   Specific reason for the transformation failure:
            #
            #   - `encoding_failed`: Error during video encoding process
            #   - `download_failed`: Could not download source video
            #   - `internal_server_error`: Unexpected server error
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error::Reason]
            required :reason,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason }

            # @!method initialize(reason:)
            #   Some parameter documentations has been truncated, see
            #   {Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error}
            #   for more details.
            #
            #   Details about the transformation error.
            #
            #   @param reason [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error::Reason] Specific reason for the transformation failure:

            # Specific reason for the transformation failure:
            #
            # - `encoding_failed`: Error during video encoding process
            # - `download_failed`: Could not download source video
            # - `internal_server_error`: Unexpected server error
            #
            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error#reason
            module Reason
              extend Imagekit::Internal::Type::Enum

              ENCODING_FAILED = :encoding_failed
              DOWNLOAD_FAILED = :download_failed
              INTERNAL_SERVER_ERROR = :internal_server_error

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation#options
          class Options < Imagekit::Internal::Type::BaseModel
            # @!attribute audio_codec
            #   Audio codec used for encoding (aac or opus).
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec, nil]
            optional :audio_codec,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec }

            # @!attribute auto_rotate
            #   Whether to automatically rotate the video based on metadata.
            #
            #   @return [Boolean, nil]
            optional :auto_rotate, Imagekit::Internal::Type::Boolean

            # @!attribute format_
            #   Output format for the transformed video or thumbnail.
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::Format, nil]
            optional :format_,
                     enum: -> {
                       Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format
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
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol, nil]
            optional :stream_protocol,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol }

            # @!attribute variants
            #   Array of quality representations for adaptive bitrate streaming.
            #
            #   @return [Array<String>, nil]
            optional :variants, Imagekit::Internal::Type::ArrayOf[String]

            # @!attribute video_codec
            #   Video codec used for encoding (h264, vp9, or av1).
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec, nil]
            optional :video_codec,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec }

            # @!method initialize(audio_codec: nil, auto_rotate: nil, format_: nil, quality: nil, stream_protocol: nil, variants: nil, video_codec: nil)
            #   Configuration options for video transformations.
            #
            #   @param audio_codec [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec] Audio codec used for encoding (aac or opus).
            #
            #   @param auto_rotate [Boolean] Whether to automatically rotate the video based on metadata.
            #
            #   @param format_ [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::Format] Output format for the transformed video or thumbnail.
            #
            #   @param quality [Integer] Quality setting for the output video.
            #
            #   @param stream_protocol [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol] Streaming protocol for adaptive bitrate streaming.
            #
            #   @param variants [Array<String>] Array of quality representations for adaptive bitrate streaming.
            #
            #   @param video_codec [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec] Video codec used for encoding (h264, vp9, or av1).

            # Audio codec used for encoding (aac or opus).
            #
            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options#audio_codec
            module AudioCodec
              extend Imagekit::Internal::Type::Enum

              AAC = :aac
              OPUS = :opus

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Output format for the transformed video or thumbnail.
            #
            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options#format_
            module Format
              extend Imagekit::Internal::Type::Enum

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
            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options#stream_protocol
            module StreamProtocol
              extend Imagekit::Internal::Type::Enum

              HLS = :HLS
              DASH = :DASH

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Video codec used for encoding (h264, vp9, or av1).
            #
            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options#video_codec
            module VideoCodec
              extend Imagekit::Internal::Type::Enum

              H264 = :h264
              VP9 = :vp9
              AV1 = :av1

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      class Request < Imagekit::Internal::Type::BaseModel
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
