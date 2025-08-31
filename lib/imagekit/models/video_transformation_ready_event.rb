# frozen_string_literal: true

module Imagekit
  module Models
    class VideoTransformationReadyEvent < Imagekit::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the event.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   Timestamp when the event was created in ISO8601 format.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekit::Models::VideoTransformationReadyEvent::Data]
      required :data, -> { Imagekit::VideoTransformationReadyEvent::Data }

      # @!attribute request
      #   Information about the original request that triggered the video transformation.
      #
      #   @return [Imagekit::Models::VideoTransformationReadyEvent::Request]
      required :request, -> { Imagekit::VideoTransformationReadyEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"video.transformation.ready"]
      required :type, const: :"video.transformation.ready"

      # @!attribute timings
      #   Performance metrics for the transformation process.
      #
      #   @return [Imagekit::Models::VideoTransformationReadyEvent::Timings, nil]
      optional :timings, -> { Imagekit::VideoTransformationReadyEvent::Timings }

      # @!method initialize(id:, created_at:, data:, request:, timings: nil, type: :"video.transformation.ready")
      #   Triggered when video encoding is finished and the transformed resource is ready
      #   to be served. This is the key event to listen for - update your database or CMS
      #   flags when you receive this so your application can start showing the
      #   transformed video to users.
      #
      #   @param id [String] Unique identifier for the event.
      #
      #   @param created_at [Time] Timestamp when the event was created in ISO8601 format.
      #
      #   @param data [Imagekit::Models::VideoTransformationReadyEvent::Data]
      #
      #   @param request [Imagekit::Models::VideoTransformationReadyEvent::Request] Information about the original request that triggered the video transformation.
      #
      #   @param timings [Imagekit::Models::VideoTransformationReadyEvent::Timings] Performance metrics for the transformation process.
      #
      #   @param type [Symbol, :"video.transformation.ready"]

      # @see Imagekit::Models::VideoTransformationReadyEvent#data
      class Data < Imagekit::Internal::Type::BaseModel
        # @!attribute asset
        #   Information about the source video asset being transformed.
        #
        #   @return [Imagekit::Models::VideoTransformationReadyEvent::Data::Asset]
        required :asset, -> { Imagekit::VideoTransformationReadyEvent::Data::Asset }

        # @!attribute transformation
        #
        #   @return [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation]
        required :transformation, -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekit::Models::VideoTransformationReadyEvent::Data::Asset] Information about the source video asset being transformed.
        #
        #   @param transformation [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation]

        # @see Imagekit::Models::VideoTransformationReadyEvent::Data#asset
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

        # @see Imagekit::Models::VideoTransformationReadyEvent::Data#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute type
          #   Type of video transformation:
          #
          #   - `video-transformation`: Standard video processing (resize, format conversion,
          #     etc.)
          #   - `gif-to-video`: Convert animated GIF to video format
          #   - `video-thumbnail`: Generate thumbnail image from video
          #
          #   @return [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation::Type }

          # @!attribute options
          #   Configuration options for video transformations.
          #
          #   @return [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation::Options }

          # @!attribute output
          #   Information about the transformed output video.
          #
          #   @return [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Output, nil]
          optional :output, -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation::Output }

          # @!method initialize(type:, options: nil, output: nil)
          #   Some parameter documentations has been truncated, see
          #   {Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation} for more
          #   details.
          #
          #   @param type [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Type] Type of video transformation:
          #
          #   @param options [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options] Configuration options for video transformations.
          #
          #   @param output [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Output] Information about the transformed output video.

          # Type of video transformation:
          #
          # - `video-transformation`: Standard video processing (resize, format conversion,
          #   etc.)
          # - `gif-to-video`: Convert animated GIF to video format
          # - `video-thumbnail`: Generate thumbnail image from video
          #
          # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation#type
          module Type
            extend Imagekit::Internal::Type::Enum

            VIDEO_TRANSFORMATION = :"video-transformation"
            GIF_TO_VIDEO = :"gif-to-video"
            VIDEO_THUMBNAIL = :"video-thumbnail"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation#options
          class Options < Imagekit::Internal::Type::BaseModel
            # @!attribute audio_codec
            #   Audio codec used for encoding (aac or opus).
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec, nil]
            optional :audio_codec,
                     enum: -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec }

            # @!attribute auto_rotate
            #   Whether to automatically rotate the video based on metadata.
            #
            #   @return [Boolean, nil]
            optional :auto_rotate, Imagekit::Internal::Type::Boolean

            # @!attribute format_
            #   Output format for the transformed video or thumbnail.
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::Format, nil]
            optional :format_,
                     enum: -> {
                       Imagekit::VideoTransformationReadyEvent::Data::Transformation::Options::Format
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
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol, nil]
            optional :stream_protocol,
                     enum: -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol }

            # @!attribute variants
            #   Array of quality representations for adaptive bitrate streaming.
            #
            #   @return [Array<String>, nil]
            optional :variants, Imagekit::Internal::Type::ArrayOf[String]

            # @!attribute video_codec
            #   Video codec used for encoding (h264 or vp9).
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec, nil]
            optional :video_codec,
                     enum: -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec }

            # @!method initialize(audio_codec: nil, auto_rotate: nil, format_: nil, quality: nil, stream_protocol: nil, variants: nil, video_codec: nil)
            #   Configuration options for video transformations.
            #
            #   @param audio_codec [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::AudioCodec] Audio codec used for encoding (aac or opus).
            #
            #   @param auto_rotate [Boolean] Whether to automatically rotate the video based on metadata.
            #
            #   @param format_ [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::Format] Output format for the transformed video or thumbnail.
            #
            #   @param quality [Integer] Quality setting for the output video.
            #
            #   @param stream_protocol [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::StreamProtocol] Streaming protocol for adaptive bitrate streaming.
            #
            #   @param variants [Array<String>] Array of quality representations for adaptive bitrate streaming.
            #
            #   @param video_codec [Symbol, Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options::VideoCodec] Video codec used for encoding (h264 or vp9).

            # Audio codec used for encoding (aac or opus).
            #
            # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options#audio_codec
            module AudioCodec
              extend Imagekit::Internal::Type::Enum

              AAC = :aac
              OPUS = :opus

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Output format for the transformed video or thumbnail.
            #
            # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options#format_
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
            # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options#stream_protocol
            module StreamProtocol
              extend Imagekit::Internal::Type::Enum

              HLS = :HLS
              DASH = :DASH

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Video codec used for encoding (h264 or vp9).
            #
            # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Options#video_codec
            module VideoCodec
              extend Imagekit::Internal::Type::Enum

              H264 = :h264
              VP9 = :vp9

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation#output
          class Output < Imagekit::Internal::Type::BaseModel
            # @!attribute url
            #   URL to access the transformed video.
            #
            #   @return [String]
            required :url, String

            # @!attribute video_metadata
            #   Metadata of the output video file.
            #
            #   @return [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata, nil]
            optional :video_metadata,
                     -> { Imagekit::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata }

            # @!method initialize(url:, video_metadata: nil)
            #   Information about the transformed output video.
            #
            #   @param url [String] URL to access the transformed video.
            #
            #   @param video_metadata [Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Output::VideoMetadata] Metadata of the output video file.

            # @see Imagekit::Models::VideoTransformationReadyEvent::Data::Transformation::Output#video_metadata
            class VideoMetadata < Imagekit::Internal::Type::BaseModel
              # @!attribute bitrate
              #   Bitrate of the output video in bits per second.
              #
              #   @return [Integer]
              required :bitrate, Integer

              # @!attribute duration
              #   Duration of the output video in seconds.
              #
              #   @return [Float]
              required :duration, Float

              # @!attribute height
              #   Height of the output video in pixels.
              #
              #   @return [Integer]
              required :height, Integer

              # @!attribute width
              #   Width of the output video in pixels.
              #
              #   @return [Integer]
              required :width, Integer

              # @!method initialize(bitrate:, duration:, height:, width:)
              #   Metadata of the output video file.
              #
              #   @param bitrate [Integer] Bitrate of the output video in bits per second.
              #
              #   @param duration [Float] Duration of the output video in seconds.
              #
              #   @param height [Integer] Height of the output video in pixels.
              #
              #   @param width [Integer] Width of the output video in pixels.
            end
          end
        end
      end

      # @see Imagekit::Models::VideoTransformationReadyEvent#request
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

      # @see Imagekit::Models::VideoTransformationReadyEvent#timings
      class Timings < Imagekit::Internal::Type::BaseModel
        # @!attribute download_duration
        #   Time spent downloading the source video from your origin or media library, in
        #   milliseconds.
        #
        #   @return [Integer, nil]
        optional :download_duration, Integer

        # @!attribute encoding_duration
        #   Time spent encoding the video, in milliseconds.
        #
        #   @return [Integer, nil]
        optional :encoding_duration, Integer

        # @!method initialize(download_duration: nil, encoding_duration: nil)
        #   Some parameter documentations has been truncated, see
        #   {Imagekit::Models::VideoTransformationReadyEvent::Timings} for more details.
        #
        #   Performance metrics for the transformation process.
        #
        #   @param download_duration [Integer] Time spent downloading the source video from your origin or media library, in mi
        #
        #   @param encoding_duration [Integer] Time spent encoding the video, in milliseconds.
      end
    end
  end
end
