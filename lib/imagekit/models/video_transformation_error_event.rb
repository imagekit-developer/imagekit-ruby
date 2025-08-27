# frozen_string_literal: true

module Imagekit
  module Models
    class VideoTransformationErrorEvent < Imagekit::Internal::Type::BaseModel
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
      #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data]
      required :data, -> { Imagekit::VideoTransformationErrorEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekit::Models::VideoTransformationErrorEvent::Request]
      required :request, -> { Imagekit::VideoTransformationErrorEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, :"video.transformation.error"]
      required :type, const: :"video.transformation.error"

      # @!method initialize(id:, created_at:, data:, request:, type: :"video.transformation.error")
      #   @param id [String] Unique identifier for the event.
      #
      #   @param created_at [Time]
      #
      #   @param data [Imagekit::Models::VideoTransformationErrorEvent::Data]
      #
      #   @param request [Imagekit::Models::VideoTransformationErrorEvent::Request]
      #
      #   @param type [Symbol, :"video.transformation.error"]

      # @see Imagekit::Models::VideoTransformationErrorEvent#data
      class Data < Imagekit::Internal::Type::BaseModel
        # @!attribute asset
        #
        #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Asset]
        required :asset, -> { Imagekit::VideoTransformationErrorEvent::Data::Asset }

        # @!attribute transformation
        #
        #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation]
        required :transformation, -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekit::Models::VideoTransformationErrorEvent::Data::Asset]
        #   @param transformation [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation]

        # @see Imagekit::Models::VideoTransformationErrorEvent::Data#asset
        class Asset < Imagekit::Internal::Type::BaseModel
          # @!attribute url
          #   Source asset URL.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:)
          #   @param url [String] Source asset URL.
        end

        # @see Imagekit::Models::VideoTransformationErrorEvent::Data#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Type }

          # @!attribute error
          #
          #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error, nil]
          optional :error, -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error }

          # @!attribute options
          #
          #   @return [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options }

          # @!method initialize(type:, error: nil, options: nil)
          #   @param type [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Type]
          #   @param error [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error]
          #   @param options [Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options]

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
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error::Reason]
            required :reason,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Error::Reason }

            # @!method initialize(reason:)
            #   @param reason [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Error::Reason]

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
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec, nil]
            optional :audio_codec,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec }

            # @!attribute auto_rotate
            #
            #   @return [Boolean, nil]
            optional :auto_rotate, Imagekit::Internal::Type::Boolean

            # @!attribute format_
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::Format, nil]
            optional :format_,
                     enum: -> {
                       Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::Format
                     },
                     api_name: :format

            # @!attribute quality
            #
            #   @return [Integer, nil]
            optional :quality, Integer

            # @!attribute stream_protocol
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol, nil]
            optional :stream_protocol,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol }

            # @!attribute variants
            #
            #   @return [Array<String>, nil]
            optional :variants, Imagekit::Internal::Type::ArrayOf[String]

            # @!attribute video_codec
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec, nil]
            optional :video_codec,
                     enum: -> { Imagekit::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec }

            # @!method initialize(audio_codec: nil, auto_rotate: nil, format_: nil, quality: nil, stream_protocol: nil, variants: nil, video_codec: nil)
            #   @param audio_codec [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::AudioCodec]
            #   @param auto_rotate [Boolean]
            #   @param format_ [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::Format]
            #   @param quality [Integer]
            #   @param stream_protocol [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::StreamProtocol]
            #   @param variants [Array<String>]
            #   @param video_codec [Symbol, Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options::VideoCodec]

            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options#audio_codec
            module AudioCodec
              extend Imagekit::Internal::Type::Enum

              AAC = :aac
              OPUS = :opus

              # @!method self.values
              #   @return [Array<Symbol>]
            end

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

            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options#stream_protocol
            module StreamProtocol
              extend Imagekit::Internal::Type::Enum

              HLS = :HLS
              DASH = :DASH

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekit::Models::VideoTransformationErrorEvent::Data::Transformation::Options#video_codec
            module VideoCodec
              extend Imagekit::Internal::Type::Enum

              H264 = :h264
              VP9 = :vp9

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      # @see Imagekit::Models::VideoTransformationErrorEvent#request
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
    end
  end
end
