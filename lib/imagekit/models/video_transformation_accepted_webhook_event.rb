# frozen_string_literal: true

module Imagekit
  module Models
    class VideoTransformationAcceptedWebhookEvent < Imagekit::Internal::Type::BaseModel
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
      #   @return [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data]
      required :data, -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data }

      # @!attribute request
      #
      #   @return [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Request]
      required :request, -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Request }

      # @!attribute type
      #
      #   @return [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Type]
      required :type, enum: -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Type }

      # @!method initialize(id:, created_at:, data:, request:, type:)
      #   @param id [String] Unique identifier for the event.
      #
      #   @param created_at [Time]
      #
      #   @param data [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data]
      #
      #   @param request [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Request]
      #
      #   @param type [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Type]

      # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent#data
      class Data < Imagekit::Internal::Type::BaseModel
        # @!attribute asset
        #
        #   @return [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Asset]
        required :asset, -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Asset }

        # @!attribute transformation
        #
        #   @return [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation]
        required :transformation, -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation }

        # @!method initialize(asset:, transformation:)
        #   @param asset [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Asset]
        #   @param transformation [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation]

        # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data#asset
        class Asset < Imagekit::Internal::Type::BaseModel
          # @!attribute url
          #   Source asset URL.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:)
          #   @param url [String] Source asset URL.
        end

        # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data#transformation
        class Transformation < Imagekit::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type]
          required :type, enum: -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type }

          # @!attribute options
          #
          #   @return [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options, nil]
          optional :options, -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options }

          # @!method initialize(type:, options: nil)
          #   @param type [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Type]
          #   @param options [Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options]

          # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation#type
          module Type
            extend Imagekit::Internal::Type::Enum

            VIDEO_TRANSFORMATION = :"video-transformation"
            GIF_TO_VIDEO = :"gif-to-video"
            VIDEO_THUMBNAIL = :"video-thumbnail"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation#options
          class Options < Imagekit::Internal::Type::BaseModel
            # @!attribute audio_codec
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec, nil]
            optional :audio_codec,
                     enum: -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec }

            # @!attribute auto_rotate
            #
            #   @return [Boolean, nil]
            optional :auto_rotate, Imagekit::Internal::Type::Boolean

            # @!attribute format_
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format, nil]
            optional :format_,
                     enum: -> {
                       Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format
                     },
                     api_name: :format

            # @!attribute quality
            #
            #   @return [Integer, nil]
            optional :quality, Integer

            # @!attribute stream_protocol
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol, nil]
            optional :stream_protocol,
                     enum: -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol }

            # @!attribute variants
            #
            #   @return [Array<String>, nil]
            optional :variants, Imagekit::Internal::Type::ArrayOf[String]

            # @!attribute video_codec
            #
            #   @return [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec, nil]
            optional :video_codec,
                     enum: -> { Imagekit::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec }

            # @!method initialize(audio_codec: nil, auto_rotate: nil, format_: nil, quality: nil, stream_protocol: nil, variants: nil, video_codec: nil)
            #   @param audio_codec [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::AudioCodec]
            #   @param auto_rotate [Boolean]
            #   @param format_ [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::Format]
            #   @param quality [Integer]
            #   @param stream_protocol [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::StreamProtocol]
            #   @param variants [Array<String>]
            #   @param video_codec [Symbol, Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options::VideoCodec]

            # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options#audio_codec
            module AudioCodec
              extend Imagekit::Internal::Type::Enum

              AAC = :aac
              OPUS = :opus

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options#format_
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

            # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options#stream_protocol
            module StreamProtocol
              extend Imagekit::Internal::Type::Enum

              HLS = :HLS
              DASH = :DASH

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent::Data::Transformation::Options#video_codec
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

      # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent#request
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

      # @see Imagekit::Models::VideoTransformationAcceptedWebhookEvent#type
      module Type
        extend Imagekit::Internal::Type::Enum

        VIDEO_TRANSFORMATION_ACCEPTED = :"video.transformation.accepted"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
