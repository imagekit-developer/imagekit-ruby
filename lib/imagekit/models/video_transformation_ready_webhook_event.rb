# frozen_string_literal: true

module Imagekit
  module Models
    class VideoTransformationReadyWebhookEvent < Imagekit::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the event.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute data
      #
      #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data]
      required :data, -> { Imagekit::VideoTransformationReadyWebhookEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Request]
      required :request, -> { Imagekit::VideoTransformationReadyWebhookEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"video.transformation.ready"]
      required :type, const: :"video.transformation.ready"

      # @!attribute timings
      #
      #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Timings, nil]
      optional :timings, -> { Imagekit::VideoTransformationReadyWebhookEvent::Timings }

      # @!method initialize(id:, created_at:, data:, request:, timings: nil, type: :"video.transformation.ready")
      #   @param id [String] Unique identifier for the event.
      #
      #   @param created_at [Time]
      #
      #   @param data [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data]
      #
      #   @param request [Imagekit::Models::VideoTransformationReadyWebhookEvent::Request]
      #
      #   @param timings [Imagekit::Models::VideoTransformationReadyWebhookEvent::Timings]
      #
      #   @param type [Symbol, :"video.transformation.ready"]

      # @see Imagekit::Models::VideoTransformationReadyWebhookEvent#data
      class Data < Imagekit::Internal::Type::BaseModel
        # @!attribute asset
        #
        #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Asset]
        required :asset, -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Asset }

        # @!attribute transformation
        #
        #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation]
        required :transformation, -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Asset]
        #   @param transformation [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation]

        # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data#asset
        class Asset < Imagekit::Internal::Type::BaseModel
          # @!attribute url
          #   Source asset URL.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:)
          #   @param url [String] Source asset URL.
        end

        # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Type }

          # @!attribute options
          #
          #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options }

          # @!attribute output
          #
          #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Output, nil]
          optional :output, -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output }

          # @!method initialize(type:, options: nil, output: nil)
          #   @param type [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Type]
          #   @param options [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options]
          #   @param output [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Output]

          # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation#type
          module Type
            extend Imagekit::Internal::Type::Enum

            VIDEO_TRANSFORMATION = :"video-transformation"
            GIF_TO_VIDEO = :"gif-to-video"
            VIDEO_THUMBNAIL = :"video-thumbnail"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation#options
          class Options < Imagekit::Internal::Type::BaseModel
            # @!attribute audio_codec
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec, nil]
            optional :audio_codec,
                     enum: -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec }

            # @!attribute auto_rotate
            #
            #   @return [Boolean, nil]
            optional :auto_rotate, Imagekit::Internal::Type::Boolean

            # @!attribute format_
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format, nil]
            optional :format_,
                     enum: -> {
                       Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format
                     },
                     api_name: :format

            # @!attribute quality
            #
            #   @return [Integer, nil]
            optional :quality, Integer

            # @!attribute stream_protocol
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol, nil]
            optional :stream_protocol,
                     enum: -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol }

            # @!attribute variants
            #
            #   @return [Array<String>, nil]
            optional :variants, Imagekit::Internal::Type::ArrayOf[String]

            # @!attribute video_codec
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec, nil]
            optional :video_codec,
                     enum: -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec }

            # @!method initialize(audio_codec: nil, auto_rotate: nil, format_: nil, quality: nil, stream_protocol: nil, variants: nil, video_codec: nil)
            #   @param audio_codec [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::AudioCodec]
            #   @param auto_rotate [Boolean]
            #   @param format_ [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::Format]
            #   @param quality [Integer]
            #   @param stream_protocol [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::StreamProtocol]
            #   @param variants [Array<String>]
            #   @param video_codec [Symbol, Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options::VideoCodec]

            # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options#audio_codec
            module AudioCodec
              extend Imagekit::Internal::Type::Enum

              AAC = :aac
              OPUS = :opus

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options#format_
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

            # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options#stream_protocol
            module StreamProtocol
              extend Imagekit::Internal::Type::Enum

              HLS = :HLS
              DASH = :DASH

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Options#video_codec
            module VideoCodec
              extend Imagekit::Internal::Type::Enum

              H264 = :h264
              VP9 = :vp9

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation#output
          class Output < Imagekit::Internal::Type::BaseModel
            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute video_metadata
            #
            #   @return [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata, nil]
            optional :video_metadata,
                     -> { Imagekit::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata }

            # @!method initialize(url:, video_metadata: nil)
            #   @param url [String]
            #   @param video_metadata [Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Output::VideoMetadata]

            # @see Imagekit::Models::VideoTransformationReadyWebhookEvent::Data::Transformation::Output#video_metadata
            class VideoMetadata < Imagekit::Internal::Type::BaseModel
              # @!attribute bitrate
              #
              #   @return [Integer]
              required :bitrate, Integer

              # @!attribute duration
              #
              #   @return [Float]
              required :duration, Float

              # @!attribute height
              #
              #   @return [Integer]
              required :height, Integer

              # @!attribute width
              #
              #   @return [Integer]
              required :width, Integer

              # @!method initialize(bitrate:, duration:, height:, width:)
              #   @param bitrate [Integer]
              #   @param duration [Float]
              #   @param height [Integer]
              #   @param width [Integer]
            end
          end
        end
      end

      # @see Imagekit::Models::VideoTransformationReadyWebhookEvent#request
      class Request < Imagekit::Internal::Type::BaseModel
        # @!attribute url
        #   URL of the submitted request.
        #
        #   @return [String]
        required :url, String

        # @!attribute x_request_id
        #   Unique ID for the originating request.
        #
        #   @return [String]
        required :x_request_id, String

        # @!attribute user_agent
        #   User-Agent header of the originating request.
        #
        #   @return [String, nil]
        optional :user_agent, String

        # @!method initialize(url:, x_request_id:, user_agent: nil)
        #   @param url [String] URL of the submitted request.
        #
        #   @param x_request_id [String] Unique ID for the originating request.
        #
        #   @param user_agent [String] User-Agent header of the originating request.
      end

      # @see Imagekit::Models::VideoTransformationReadyWebhookEvent#timings
      class Timings < Imagekit::Internal::Type::BaseModel
        # @!attribute download_duration
        #   Milliseconds spent downloading the source.
        #
        #   @return [Integer, nil]
        optional :download_duration, Integer

        # @!attribute encoding_duration
        #   Milliseconds spent encoding.
        #
        #   @return [Integer, nil]
        optional :encoding_duration, Integer

        # @!method initialize(download_duration: nil, encoding_duration: nil)
        #   @param download_duration [Integer] Milliseconds spent downloading the source.
        #
        #   @param encoding_duration [Integer] Milliseconds spent encoding.
      end
    end
  end
end
