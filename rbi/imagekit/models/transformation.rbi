# typed: strong

module Imagekit
  module Models
    class Transformation < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekit::Transformation, Imagekit::Internal::AnyHash)
        end

      # Uses AI to change the background. Provide a text prompt or a base64-encoded
      # prompt, e.g., `prompt-snow road` or `prompte-[urlencoded_base64_encoded_text]`.
      # Not supported inside overlay.
      sig { returns(T.nilable(String)) }
      attr_reader :ai_change_background

      sig { params(ai_change_background: String).void }
      attr_writer :ai_change_background

      # Adds an AI-based drop shadow around a foreground object on a transparent or
      # removed background. Optionally, control the direction, elevation, and saturation
      # of the light source (e.g., `az-45` to change light direction). Pass `true` for
      # the default drop shadow, or provide a string for a custom drop shadow. Supported
      # inside overlay.
      sig do
        returns(
          T.nilable(
            T.any(Imagekit::Transformation::AIDropShadow::OrBoolean, String)
          )
        )
      end
      attr_reader :ai_drop_shadow

      sig do
        params(
          ai_drop_shadow:
            T.any(Imagekit::Transformation::AIDropShadow::OrBoolean, String)
        ).void
      end
      attr_writer :ai_drop_shadow

      # Applies ImageKit's in-house background removal. Supported inside overlay.
      sig do
        returns(
          T.nilable(Imagekit::Transformation::AIRemoveBackground::OrBoolean)
        )
      end
      attr_reader :ai_remove_background

      sig do
        params(
          ai_remove_background:
            Imagekit::Transformation::AIRemoveBackground::OrBoolean
        ).void
      end
      attr_writer :ai_remove_background

      # Uses third-party background removal. Note: It is recommended to use
      # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      # Supported inside overlay.
      sig do
        returns(
          T.nilable(
            Imagekit::Transformation::AIRemoveBackgroundExternal::OrBoolean
          )
        )
      end
      attr_reader :ai_remove_background_external

      sig do
        params(
          ai_remove_background_external:
            Imagekit::Transformation::AIRemoveBackgroundExternal::OrBoolean
        ).void
      end
      attr_writer :ai_remove_background_external

      # Performs AI-based retouching to improve faces or product shots. Not supported
      # inside overlay.
      sig { returns(T.nilable(Imagekit::Transformation::AIRetouch::OrBoolean)) }
      attr_reader :ai_retouch

      sig do
        params(ai_retouch: Imagekit::Transformation::AIRetouch::OrBoolean).void
      end
      attr_writer :ai_retouch

      # Upscales images beyond their original dimensions using AI. Not supported inside
      # overlay.
      sig { returns(T.nilable(Imagekit::Transformation::AIUpscale::OrBoolean)) }
      attr_reader :ai_upscale

      sig do
        params(ai_upscale: Imagekit::Transformation::AIUpscale::OrBoolean).void
      end
      attr_writer :ai_upscale

      # Generates a variation of an image using AI. This produces a new image with
      # slight variations from the original, such as changes in color, texture, and
      # other visual elements, while preserving the structure and essence of the
      # original image. Not supported inside overlay.
      sig do
        returns(T.nilable(Imagekit::Transformation::AIVariation::OrBoolean))
      end
      attr_reader :ai_variation

      sig do
        params(
          ai_variation: Imagekit::Transformation::AIVariation::OrBoolean
        ).void
      end
      attr_writer :ai_variation

      # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      # or an expression like `iar_div_2`.
      sig do
        returns(T.nilable(Imagekit::Transformation::AspectRatio::Variants))
      end
      attr_reader :aspect_ratio

      sig do
        params(
          aspect_ratio: Imagekit::Transformation::AspectRatio::Variants
        ).void
      end
      attr_writer :aspect_ratio

      # Specifies the audio codec, e.g., `aac`, `opus`, or `none`.
      sig { returns(T.nilable(Imagekit::Transformation::AudioCodec::OrSymbol)) }
      attr_reader :audio_codec

      sig do
        params(audio_codec: Imagekit::Transformation::AudioCodec::OrSymbol).void
      end
      attr_writer :audio_codec

      # Specifies the background to be used in conjunction with certain cropping
      # strategies when resizing an image.
      #
      # - A solid color: e.g., `red`, `F3F3F3`, `AAFF0010`.
      # - A blurred background: e.g., `blurred`, `blurred_25_N15`, etc.
      # - Expand the image boundaries using generative fill: `genfill`. Not supported
      #   inside overlay. Optionally, control the background scene by passing a text
      #   prompt: `genfill[:-prompt-${text}]` or
      #   `genfill[:-prompte-${urlencoded_base64_encoded_text}]`.
      sig { returns(T.nilable(String)) }
      attr_reader :background

      sig { params(background: String).void }
      attr_writer :background

      # Specifies the Gaussian blur level. Accepts an integer value between 1 and 100,
      # or an expression like `bl-10`.
      sig { returns(T.nilable(Float)) }
      attr_reader :blur

      sig { params(blur: Float).void }
      attr_writer :blur

      # Adds a border to the output media. Accepts a string in the format
      # `<border-width>_<hex-code>` (e.g., `5_FFF000` for a 5px yellow border), or an
      # expression like `ih_div_20_FF00FF`.
      sig { returns(T.nilable(String)) }
      attr_reader :border

      sig { params(border: String).void }
      attr_writer :border

      # Indicates whether the output image should retain the original color profile.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :color_profile

      sig { params(color_profile: T::Boolean).void }
      attr_writer :color_profile

      # Automatically enhances the contrast of an image (contrast stretch).
      sig do
        returns(T.nilable(Imagekit::Transformation::ContrastStretch::OrBoolean))
      end
      attr_reader :contrast_stretch

      sig do
        params(
          contrast_stretch: Imagekit::Transformation::ContrastStretch::OrBoolean
        ).void
      end
      attr_writer :contrast_stretch

      # Crop modes for image resizing
      sig { returns(T.nilable(Imagekit::Transformation::Crop::OrSymbol)) }
      attr_reader :crop

      sig { params(crop: Imagekit::Transformation::Crop::OrSymbol).void }
      attr_writer :crop

      # Additional crop modes for image resizing
      sig { returns(T.nilable(Imagekit::Transformation::CropMode::OrSymbol)) }
      attr_reader :crop_mode

      sig do
        params(crop_mode: Imagekit::Transformation::CropMode::OrSymbol).void
      end
      attr_writer :crop_mode

      # Specifies a fallback image if the resource is not found, e.g., a URL or file
      # path.
      sig { returns(T.nilable(String)) }
      attr_reader :default_image

      sig { params(default_image: String).void }
      attr_writer :default_image

      # Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio
      # (DPR) calculation.
      sig { returns(T.nilable(Float)) }
      attr_reader :dpr

      sig { params(dpr: Float).void }
      attr_writer :dpr

      # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to indicate the length from the start offset.
      # Arithmetic expressions are supported.
      sig { returns(T.nilable(Imagekit::Transformation::Duration::Variants)) }
      attr_reader :duration

      sig do
        params(duration: Imagekit::Transformation::Duration::Variants).void
      end
      attr_writer :duration

      # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to define a time window. Arithmetic expressions
      # are supported.
      sig { returns(T.nilable(Imagekit::Transformation::EndOffset::Variants)) }
      attr_reader :end_offset

      sig do
        params(end_offset: Imagekit::Transformation::EndOffset::Variants).void
      end
      attr_writer :end_offset

      # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      # `v_h`.
      sig { returns(T.nilable(Imagekit::Transformation::Flip::OrSymbol)) }
      attr_reader :flip

      sig { params(flip: Imagekit::Transformation::Flip::OrSymbol).void }
      attr_writer :flip

      # This parameter can be used with pad resize, maintain ratio, or extract crop to
      # modify the padding or cropping behavior.
      sig { returns(T.nilable(String)) }
      attr_reader :focus

      sig { params(focus: String).void }
      attr_writer :focus

      # Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
      # `mp4`, or `auto`. You can also pass `orig` for images to return the original
      # format. ImageKit automatically delivers images and videos in the optimal format
      # based on device support unless overridden by the dashboard settings or the
      # format parameter.
      sig { returns(T.nilable(Imagekit::Transformation::Format::OrSymbol)) }
      attr_reader :format_

      sig { params(format_: Imagekit::Transformation::Format::OrSymbol).void }
      attr_writer :format_

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient.
      sig do
        returns(
          T.nilable(
            T.any(Imagekit::Transformation::Gradient::OrBoolean, String)
          )
        )
      end
      attr_reader :gradient

      sig do
        params(
          gradient: T.any(Imagekit::Transformation::Gradient::OrBoolean, String)
        ).void
      end
      attr_writer :gradient

      # Enables a grayscale effect for images.
      sig { returns(T.nilable(Imagekit::Transformation::Grayscale::OrBoolean)) }
      attr_reader :grayscale

      sig do
        params(grayscale: Imagekit::Transformation::Grayscale::OrBoolean).void
      end
      attr_writer :grayscale

      # Specifies the height of the output. If a value between 0 and 1 is provided, it
      # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`).
      sig { returns(T.nilable(Imagekit::Transformation::Height::Variants)) }
      attr_reader :height

      sig { params(height: Imagekit::Transformation::Height::Variants).void }
      attr_writer :height

      # Specifies whether the output image (in JPEG or PNG) should be compressed
      # losslessly.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :lossless

      sig { params(lossless: T::Boolean).void }
      attr_writer :lossless

      # By default, ImageKit removes all metadata during automatic image compression.
      # Set this to true to preserve metadata.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :metadata

      sig { params(metadata: T::Boolean).void }
      attr_writer :metadata

      # Named transformation reference
      sig { returns(T.nilable(String)) }
      attr_reader :named

      sig { params(named: String).void }
      attr_writer :named

      # Specifies the opacity level of the output image.
      sig { returns(T.nilable(Float)) }
      attr_reader :opacity

      sig { params(opacity: Float).void }
      attr_writer :opacity

      # If set to true, serves the original file without applying any transformations.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :original

      sig { params(original: T::Boolean).void }
      attr_writer :original

      # Specifies an overlay to be applied on the parent image or video. ImageKit
      # supports overlays including images, text, videos, subtitles, and solid colors.
      sig { returns(T.nilable(Imagekit::Overlay)) }
      attr_reader :overlay

      sig { params(overlay: Imagekit::Overlay).void }
      attr_writer :overlay

      # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer).
      sig { returns(T.nilable(Imagekit::Transformation::Page::Variants)) }
      attr_reader :page

      sig { params(page: Imagekit::Transformation::Page::Variants).void }
      attr_writer :page

      # Specifies whether the output JPEG image should be rendered progressively.
      # Progressive loading begins with a low-quality, pixelated version of the full
      # image, which gradually improves to provide a faster perceived load time.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :progressive

      sig { params(progressive: T::Boolean).void }
      attr_writer :progressive

      # Specifies the quality of the output image for lossy formats such as JPEG, WebP,
      # and AVIF. A higher quality value results in a larger file size with better
      # quality, while a lower value produces a smaller file size with reduced quality.
      sig { returns(T.nilable(Float)) }
      attr_reader :quality

      sig { params(quality: Float).void }
      attr_writer :quality

      # Specifies the corner radius for rounded corners (e.g., 20) or `max` for
      # circular/oval shapes.
      sig do
        returns(
          T.nilable(T.any(Float, Imagekit::Transformation::Radius::OrSymbol))
        )
      end
      attr_reader :radius

      sig do
        params(
          radius: T.any(Float, Imagekit::Transformation::Radius::OrSymbol)
        ).void
      end
      attr_writer :radius

      # Pass any transformation not directly supported by the SDK. This transformation
      # string is appended to the URL as provided.
      sig { returns(T.nilable(String)) }
      attr_reader :raw

      sig { params(raw: String).void }
      attr_writer :raw

      # Specifies the rotation angle in degrees. Positive values rotate the image
      # clockwise; you can also use, for example, `N40` for counterclockwise rotation or
      # `auto` to use the orientation specified in the image's EXIF data. For videos,
      # only the following values are supported: 0, 90, 180, 270, or 360.
      sig { returns(T.nilable(Imagekit::Transformation::Rotation::Variants)) }
      attr_reader :rotation

      sig do
        params(rotation: Imagekit::Transformation::Rotation::Variants).void
      end
      attr_writer :rotation

      # Adds a shadow beneath solid objects in an image with a transparent background.
      # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      # shadow, or provide a string for a custom shadow.
      sig do
        returns(
          T.nilable(T.any(Imagekit::Transformation::Shadow::OrBoolean, String))
        )
      end
      attr_reader :shadow

      sig do
        params(
          shadow: T.any(Imagekit::Transformation::Shadow::OrBoolean, String)
        ).void
      end
      attr_writer :shadow

      # Sharpens the input image, highlighting edges and finer details. Pass `true` for
      # default sharpening, or provide a numeric value for custom sharpening.
      sig do
        returns(
          T.nilable(T.any(Imagekit::Transformation::Sharpen::OrBoolean, Float))
        )
      end
      attr_reader :sharpen

      sig do
        params(
          sharpen: T.any(Imagekit::Transformation::Sharpen::OrBoolean, Float)
        ).void
      end
      attr_writer :sharpen

      # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      # `10.5`. Arithmetic expressions are also supported.
      sig do
        returns(T.nilable(Imagekit::Transformation::StartOffset::Variants))
      end
      attr_reader :start_offset

      sig do
        params(
          start_offset: Imagekit::Transformation::StartOffset::Variants
        ).void
      end
      attr_writer :start_offset

      # An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`,
      # `480`, `720`, `1080`].
      sig do
        returns(T.nilable(T::Array[Imagekit::StreamingResolution::OrSymbol]))
      end
      attr_reader :streaming_resolutions

      sig do
        params(
          streaming_resolutions:
            T::Array[Imagekit::StreamingResolution::OrSymbol]
        ).void
      end
      attr_writer :streaming_resolutions

      # Useful for images with a solid or nearly solid background and a central object.
      # This parameter trims the background, leaving only the central object in the
      # output image.
      sig do
        returns(
          T.nilable(T.any(Imagekit::Transformation::Trim::OrBoolean, Float))
        )
      end
      attr_reader :trim

      sig do
        params(
          trim: T.any(Imagekit::Transformation::Trim::OrBoolean, Float)
        ).void
      end
      attr_writer :trim

      # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      # default unsharp mask, or provide a string for a custom unsharp mask.
      sig do
        returns(
          T.nilable(
            T.any(Imagekit::Transformation::UnsharpMask::OrBoolean, String)
          )
        )
      end
      attr_reader :unsharp_mask

      sig do
        params(
          unsharp_mask:
            T.any(Imagekit::Transformation::UnsharpMask::OrBoolean, String)
        ).void
      end
      attr_writer :unsharp_mask

      # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`.
      sig { returns(T.nilable(Imagekit::Transformation::VideoCodec::OrSymbol)) }
      attr_reader :video_codec

      sig do
        params(video_codec: Imagekit::Transformation::VideoCodec::OrSymbol).void
      end
      attr_writer :video_codec

      # Specifies the width of the output. If a value between 0 and 1 is provided, it is
      # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      # can also supply arithmetic expressions (e.g., `iw_div_2`).
      sig { returns(T.nilable(Imagekit::Transformation::Width::Variants)) }
      attr_reader :width

      sig { params(width: Imagekit::Transformation::Width::Variants).void }
      attr_writer :width

      # Focus using cropped image coordinates - X coordinate
      sig { returns(T.nilable(Imagekit::Transformation::X::Variants)) }
      attr_reader :x

      sig { params(x: Imagekit::Transformation::X::Variants).void }
      attr_writer :x

      # Focus using cropped image coordinates - X center coordinate
      sig { returns(T.nilable(Imagekit::Transformation::XCenter::Variants)) }
      attr_reader :x_center

      sig { params(x_center: Imagekit::Transformation::XCenter::Variants).void }
      attr_writer :x_center

      # Focus using cropped image coordinates - Y coordinate
      sig { returns(T.nilable(Imagekit::Transformation::Y::Variants)) }
      attr_reader :y_

      sig { params(y_: Imagekit::Transformation::Y::Variants).void }
      attr_writer :y_

      # Focus using cropped image coordinates - Y center coordinate
      sig { returns(T.nilable(Imagekit::Transformation::YCenter::Variants)) }
      attr_reader :y_center

      sig { params(y_center: Imagekit::Transformation::YCenter::Variants).void }
      attr_writer :y_center

      # Accepts a numeric value that determines how much to zoom in or out of the
      # cropped area. It should be used in conjunction with fo-face or fo-<object_name>.
      sig { returns(T.nilable(Float)) }
      attr_reader :zoom

      sig { params(zoom: Float).void }
      attr_writer :zoom

      # The SDK provides easy-to-use names for transformations. These names are
      # converted to the corresponding transformation string before being added to the
      # URL. SDKs are updated regularly to support new transformations. If you want to
      # use a transformation that is not supported by the SDK, You can use the `raw`
      # parameter to pass the transformation string directly.
      sig do
        params(
          ai_change_background: String,
          ai_drop_shadow:
            T.any(Imagekit::Transformation::AIDropShadow::OrBoolean, String),
          ai_remove_background:
            Imagekit::Transformation::AIRemoveBackground::OrBoolean,
          ai_remove_background_external:
            Imagekit::Transformation::AIRemoveBackgroundExternal::OrBoolean,
          ai_retouch: Imagekit::Transformation::AIRetouch::OrBoolean,
          ai_upscale: Imagekit::Transformation::AIUpscale::OrBoolean,
          ai_variation: Imagekit::Transformation::AIVariation::OrBoolean,
          aspect_ratio: Imagekit::Transformation::AspectRatio::Variants,
          audio_codec: Imagekit::Transformation::AudioCodec::OrSymbol,
          background: String,
          blur: Float,
          border: String,
          color_profile: T::Boolean,
          contrast_stretch:
            Imagekit::Transformation::ContrastStretch::OrBoolean,
          crop: Imagekit::Transformation::Crop::OrSymbol,
          crop_mode: Imagekit::Transformation::CropMode::OrSymbol,
          default_image: String,
          dpr: Float,
          duration: Imagekit::Transformation::Duration::Variants,
          end_offset: Imagekit::Transformation::EndOffset::Variants,
          flip: Imagekit::Transformation::Flip::OrSymbol,
          focus: String,
          format_: Imagekit::Transformation::Format::OrSymbol,
          gradient:
            T.any(Imagekit::Transformation::Gradient::OrBoolean, String),
          grayscale: Imagekit::Transformation::Grayscale::OrBoolean,
          height: Imagekit::Transformation::Height::Variants,
          lossless: T::Boolean,
          metadata: T::Boolean,
          named: String,
          opacity: Float,
          original: T::Boolean,
          overlay: Imagekit::Overlay,
          page: Imagekit::Transformation::Page::Variants,
          progressive: T::Boolean,
          quality: Float,
          radius: T.any(Float, Imagekit::Transformation::Radius::OrSymbol),
          raw: String,
          rotation: Imagekit::Transformation::Rotation::Variants,
          shadow: T.any(Imagekit::Transformation::Shadow::OrBoolean, String),
          sharpen: T.any(Imagekit::Transformation::Sharpen::OrBoolean, Float),
          start_offset: Imagekit::Transformation::StartOffset::Variants,
          streaming_resolutions:
            T::Array[Imagekit::StreamingResolution::OrSymbol],
          trim: T.any(Imagekit::Transformation::Trim::OrBoolean, Float),
          unsharp_mask:
            T.any(Imagekit::Transformation::UnsharpMask::OrBoolean, String),
          video_codec: Imagekit::Transformation::VideoCodec::OrSymbol,
          width: Imagekit::Transformation::Width::Variants,
          x: Imagekit::Transformation::X::Variants,
          x_center: Imagekit::Transformation::XCenter::Variants,
          y_: Imagekit::Transformation::Y::Variants,
          y_center: Imagekit::Transformation::YCenter::Variants,
          zoom: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # Uses AI to change the background. Provide a text prompt or a base64-encoded
        # prompt, e.g., `prompt-snow road` or `prompte-[urlencoded_base64_encoded_text]`.
        # Not supported inside overlay.
        ai_change_background: nil,
        # Adds an AI-based drop shadow around a foreground object on a transparent or
        # removed background. Optionally, control the direction, elevation, and saturation
        # of the light source (e.g., `az-45` to change light direction). Pass `true` for
        # the default drop shadow, or provide a string for a custom drop shadow. Supported
        # inside overlay.
        ai_drop_shadow: nil,
        # Applies ImageKit's in-house background removal. Supported inside overlay.
        ai_remove_background: nil,
        # Uses third-party background removal. Note: It is recommended to use
        # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
        # Supported inside overlay.
        ai_remove_background_external: nil,
        # Performs AI-based retouching to improve faces or product shots. Not supported
        # inside overlay.
        ai_retouch: nil,
        # Upscales images beyond their original dimensions using AI. Not supported inside
        # overlay.
        ai_upscale: nil,
        # Generates a variation of an image using AI. This produces a new image with
        # slight variations from the original, such as changes in color, texture, and
        # other visual elements, while preserving the structure and essence of the
        # original image. Not supported inside overlay.
        ai_variation: nil,
        # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
        # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
        # or an expression like `iar_div_2`.
        aspect_ratio: nil,
        # Specifies the audio codec, e.g., `aac`, `opus`, or `none`.
        audio_codec: nil,
        # Specifies the background to be used in conjunction with certain cropping
        # strategies when resizing an image.
        #
        # - A solid color: e.g., `red`, `F3F3F3`, `AAFF0010`.
        # - A blurred background: e.g., `blurred`, `blurred_25_N15`, etc.
        # - Expand the image boundaries using generative fill: `genfill`. Not supported
        #   inside overlay. Optionally, control the background scene by passing a text
        #   prompt: `genfill[:-prompt-${text}]` or
        #   `genfill[:-prompte-${urlencoded_base64_encoded_text}]`.
        background: nil,
        # Specifies the Gaussian blur level. Accepts an integer value between 1 and 100,
        # or an expression like `bl-10`.
        blur: nil,
        # Adds a border to the output media. Accepts a string in the format
        # `<border-width>_<hex-code>` (e.g., `5_FFF000` for a 5px yellow border), or an
        # expression like `ih_div_20_FF00FF`.
        border: nil,
        # Indicates whether the output image should retain the original color profile.
        color_profile: nil,
        # Automatically enhances the contrast of an image (contrast stretch).
        contrast_stretch: nil,
        # Crop modes for image resizing
        crop: nil,
        # Additional crop modes for image resizing
        crop_mode: nil,
        # Specifies a fallback image if the resource is not found, e.g., a URL or file
        # path.
        default_image: nil,
        # Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio
        # (DPR) calculation.
        dpr: nil,
        # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
        # Typically used with startOffset to indicate the length from the start offset.
        # Arithmetic expressions are supported.
        duration: nil,
        # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
        # Typically used with startOffset to define a time window. Arithmetic expressions
        # are supported.
        end_offset: nil,
        # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
        # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
        # `v_h`.
        flip: nil,
        # This parameter can be used with pad resize, maintain ratio, or extract crop to
        # modify the padding or cropping behavior.
        focus: nil,
        # Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
        # `mp4`, or `auto`. You can also pass `orig` for images to return the original
        # format. ImageKit automatically delivers images and videos in the optimal format
        # based on device support unless overridden by the dashboard settings or the
        # format parameter.
        format_: nil,
        # Creates a linear gradient with two colors. Pass `true` for a default gradient,
        # or provide a string for a custom gradient.
        gradient: nil,
        # Enables a grayscale effect for images.
        grayscale: nil,
        # Specifies the height of the output. If a value between 0 and 1 is provided, it
        # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
        # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`).
        height: nil,
        # Specifies whether the output image (in JPEG or PNG) should be compressed
        # losslessly.
        lossless: nil,
        # By default, ImageKit removes all metadata during automatic image compression.
        # Set this to true to preserve metadata.
        metadata: nil,
        # Named transformation reference
        named: nil,
        # Specifies the opacity level of the output image.
        opacity: nil,
        # If set to true, serves the original file without applying any transformations.
        original: nil,
        # Specifies an overlay to be applied on the parent image or video. ImageKit
        # supports overlays including images, text, videos, subtitles, and solid colors.
        overlay: nil,
        # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
        # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
        # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer).
        page: nil,
        # Specifies whether the output JPEG image should be rendered progressively.
        # Progressive loading begins with a low-quality, pixelated version of the full
        # image, which gradually improves to provide a faster perceived load time.
        progressive: nil,
        # Specifies the quality of the output image for lossy formats such as JPEG, WebP,
        # and AVIF. A higher quality value results in a larger file size with better
        # quality, while a lower value produces a smaller file size with reduced quality.
        quality: nil,
        # Specifies the corner radius for rounded corners (e.g., 20) or `max` for
        # circular/oval shapes.
        radius: nil,
        # Pass any transformation not directly supported by the SDK. This transformation
        # string is appended to the URL as provided.
        raw: nil,
        # Specifies the rotation angle in degrees. Positive values rotate the image
        # clockwise; you can also use, for example, `N40` for counterclockwise rotation or
        # `auto` to use the orientation specified in the image's EXIF data. For videos,
        # only the following values are supported: 0, 90, 180, 270, or 360.
        rotation: nil,
        # Adds a shadow beneath solid objects in an image with a transparent background.
        # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
        # shadow, or provide a string for a custom shadow.
        shadow: nil,
        # Sharpens the input image, highlighting edges and finer details. Pass `true` for
        # default sharpening, or provide a numeric value for custom sharpening.
        sharpen: nil,
        # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
        # `10.5`. Arithmetic expressions are also supported.
        start_offset: nil,
        # An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`,
        # `480`, `720`, `1080`].
        streaming_resolutions: nil,
        # Useful for images with a solid or nearly solid background and a central object.
        # This parameter trims the background, leaving only the central object in the
        # output image.
        trim: nil,
        # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
        # default unsharp mask, or provide a string for a custom unsharp mask.
        unsharp_mask: nil,
        # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`.
        video_codec: nil,
        # Specifies the width of the output. If a value between 0 and 1 is provided, it is
        # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
        # can also supply arithmetic expressions (e.g., `iw_div_2`).
        width: nil,
        # Focus using cropped image coordinates - X coordinate
        x: nil,
        # Focus using cropped image coordinates - X center coordinate
        x_center: nil,
        # Focus using cropped image coordinates - Y coordinate
        y_: nil,
        # Focus using cropped image coordinates - Y center coordinate
        y_center: nil,
        # Accepts a numeric value that determines how much to zoom in or out of the
        # cropped area. It should be used in conjunction with fo-face or fo-<object_name>.
        zoom: nil
      )
      end

      sig do
        override.returns(
          {
            ai_change_background: String,
            ai_drop_shadow:
              T.any(Imagekit::Transformation::AIDropShadow::OrBoolean, String),
            ai_remove_background:
              Imagekit::Transformation::AIRemoveBackground::OrBoolean,
            ai_remove_background_external:
              Imagekit::Transformation::AIRemoveBackgroundExternal::OrBoolean,
            ai_retouch: Imagekit::Transformation::AIRetouch::OrBoolean,
            ai_upscale: Imagekit::Transformation::AIUpscale::OrBoolean,
            ai_variation: Imagekit::Transformation::AIVariation::OrBoolean,
            aspect_ratio: Imagekit::Transformation::AspectRatio::Variants,
            audio_codec: Imagekit::Transformation::AudioCodec::OrSymbol,
            background: String,
            blur: Float,
            border: String,
            color_profile: T::Boolean,
            contrast_stretch:
              Imagekit::Transformation::ContrastStretch::OrBoolean,
            crop: Imagekit::Transformation::Crop::OrSymbol,
            crop_mode: Imagekit::Transformation::CropMode::OrSymbol,
            default_image: String,
            dpr: Float,
            duration: Imagekit::Transformation::Duration::Variants,
            end_offset: Imagekit::Transformation::EndOffset::Variants,
            flip: Imagekit::Transformation::Flip::OrSymbol,
            focus: String,
            format_: Imagekit::Transformation::Format::OrSymbol,
            gradient:
              T.any(Imagekit::Transformation::Gradient::OrBoolean, String),
            grayscale: Imagekit::Transformation::Grayscale::OrBoolean,
            height: Imagekit::Transformation::Height::Variants,
            lossless: T::Boolean,
            metadata: T::Boolean,
            named: String,
            opacity: Float,
            original: T::Boolean,
            overlay: Imagekit::Overlay,
            page: Imagekit::Transformation::Page::Variants,
            progressive: T::Boolean,
            quality: Float,
            radius: T.any(Float, Imagekit::Transformation::Radius::OrSymbol),
            raw: String,
            rotation: Imagekit::Transformation::Rotation::Variants,
            shadow: T.any(Imagekit::Transformation::Shadow::OrBoolean, String),
            sharpen: T.any(Imagekit::Transformation::Sharpen::OrBoolean, Float),
            start_offset: Imagekit::Transformation::StartOffset::Variants,
            streaming_resolutions:
              T::Array[Imagekit::StreamingResolution::OrSymbol],
            trim: T.any(Imagekit::Transformation::Trim::OrBoolean, Float),
            unsharp_mask:
              T.any(Imagekit::Transformation::UnsharpMask::OrBoolean, String),
            video_codec: Imagekit::Transformation::VideoCodec::OrSymbol,
            width: Imagekit::Transformation::Width::Variants,
            x: Imagekit::Transformation::X::Variants,
            x_center: Imagekit::Transformation::XCenter::Variants,
            y_: Imagekit::Transformation::Y::Variants,
            y_center: Imagekit::Transformation::YCenter::Variants,
            zoom: Float
          }
        )
      end
      def to_hash
      end

      # Adds an AI-based drop shadow around a foreground object on a transparent or
      # removed background. Optionally, control the direction, elevation, and saturation
      # of the light source (e.g., `az-45` to change light direction). Pass `true` for
      # the default drop shadow, or provide a string for a custom drop shadow. Supported
      # inside overlay.
      module AIDropShadow
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Imagekit::Transformation::AIDropShadow::TaggedBoolean, String)
          end

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::AIDropShadow::Variants]
          )
        end
        def self.variants
        end

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::AIDropShadow)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(true, Imagekit::Transformation::AIDropShadow::TaggedBoolean)
      end

      # Applies ImageKit's in-house background removal. Supported inside overlay.
      module AIRemoveBackground
        extend Imagekit::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::AIRemoveBackground)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Imagekit::Transformation::AIRemoveBackground::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::Transformation::AIRemoveBackground::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      # Uses third-party background removal. Note: It is recommended to use
      # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      # Supported inside overlay.
      module AIRemoveBackgroundExternal
        extend Imagekit::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              Imagekit::Transformation::AIRemoveBackgroundExternal
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Imagekit::Transformation::AIRemoveBackgroundExternal::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Imagekit::Transformation::AIRemoveBackgroundExternal::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      # Performs AI-based retouching to improve faces or product shots. Not supported
      # inside overlay.
      module AIRetouch
        extend Imagekit::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::AIRetouch)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::AIRetouch::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::AIRetouch::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Upscales images beyond their original dimensions using AI. Not supported inside
      # overlay.
      module AIUpscale
        extend Imagekit::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::AIUpscale)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::AIUpscale::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::AIUpscale::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Generates a variation of an image using AI. This produces a new image with
      # slight variations from the original, such as changes in color, texture, and
      # other visual elements, while preserving the structure and essence of the
      # original image. Not supported inside overlay.
      module AIVariation
        extend Imagekit::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::AIVariation)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::AIVariation::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::AIVariation::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      # or an expression like `iar_div_2`.
      module AspectRatio
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::AspectRatio::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the audio codec, e.g., `aac`, `opus`, or `none`.
      module AudioCodec
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::Transformation::AudioCodec) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AAC = T.let(:aac, Imagekit::Transformation::AudioCodec::TaggedSymbol)
        OPUS = T.let(:opus, Imagekit::Transformation::AudioCodec::TaggedSymbol)
        NONE = T.let(:none, Imagekit::Transformation::AudioCodec::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::AudioCodec::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Automatically enhances the contrast of an image (contrast stretch).
      module ContrastStretch
        extend Imagekit::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::ContrastStretch)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(true, Imagekit::Transformation::ContrastStretch::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::ContrastStretch::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Crop modes for image resizing
      module Crop
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::Transformation::Crop) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FORCE = T.let(:force, Imagekit::Transformation::Crop::TaggedSymbol)
        AT_MAX = T.let(:at_max, Imagekit::Transformation::Crop::TaggedSymbol)
        AT_MAX_ENLARGE =
          T.let(:at_max_enlarge, Imagekit::Transformation::Crop::TaggedSymbol)
        AT_LEAST =
          T.let(:at_least, Imagekit::Transformation::Crop::TaggedSymbol)
        MAINTAIN_RATIO =
          T.let(:maintain_ratio, Imagekit::Transformation::Crop::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Crop::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Additional crop modes for image resizing
      module CropMode
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::Transformation::CropMode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PAD_RESIZE =
          T.let(:pad_resize, Imagekit::Transformation::CropMode::TaggedSymbol)
        EXTRACT =
          T.let(:extract, Imagekit::Transformation::CropMode::TaggedSymbol)
        PAD_EXTRACT =
          T.let(:pad_extract, Imagekit::Transformation::CropMode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::CropMode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to indicate the length from the start offset.
      # Arithmetic expressions are supported.
      module Duration
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Duration::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to define a time window. Arithmetic expressions
      # are supported.
      module EndOffset
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::EndOffset::Variants]
          )
        end
        def self.variants
        end
      end

      # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      # `v_h`.
      module Flip
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::Transformation::Flip) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        H = T.let(:h, Imagekit::Transformation::Flip::TaggedSymbol)
        V = T.let(:v, Imagekit::Transformation::Flip::TaggedSymbol)
        H_V = T.let(:h_v, Imagekit::Transformation::Flip::TaggedSymbol)
        V_H = T.let(:v_h, Imagekit::Transformation::Flip::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Flip::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
      # `mp4`, or `auto`. You can also pass `orig` for images to return the original
      # format. ImageKit automatically delivers images and videos in the optimal format
      # based on device support unless overridden by the dashboard settings or the
      # format parameter.
      module Format
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::Transformation::Format) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekit::Transformation::Format::TaggedSymbol)
        WEBP = T.let(:webp, Imagekit::Transformation::Format::TaggedSymbol)
        JPG = T.let(:jpg, Imagekit::Transformation::Format::TaggedSymbol)
        JPEG = T.let(:jpeg, Imagekit::Transformation::Format::TaggedSymbol)
        PNG = T.let(:png, Imagekit::Transformation::Format::TaggedSymbol)
        GIF = T.let(:gif, Imagekit::Transformation::Format::TaggedSymbol)
        SVG = T.let(:svg, Imagekit::Transformation::Format::TaggedSymbol)
        MP4 = T.let(:mp4, Imagekit::Transformation::Format::TaggedSymbol)
        WEBM = T.let(:webm, Imagekit::Transformation::Format::TaggedSymbol)
        AVIF = T.let(:avif, Imagekit::Transformation::Format::TaggedSymbol)
        ORIG = T.let(:orig, Imagekit::Transformation::Format::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Format::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient.
      module Gradient
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Imagekit::Transformation::Gradient::TaggedBoolean, String)
          end

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Gradient::Variants]
          )
        end
        def self.variants
        end

        TaggedBoolean =
          T.type_alias { T.all(T::Boolean, Imagekit::Transformation::Gradient) }
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::Gradient::TaggedBoolean)
      end

      # Enables a grayscale effect for images.
      module Grayscale
        extend Imagekit::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::Grayscale)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::Grayscale::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Grayscale::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Specifies the height of the output. If a value between 0 and 1 is provided, it
      # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`).
      module Height
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::Transformation::Height::Variants])
        end
        def self.variants
        end
      end

      # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer).
      module Page
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::Transformation::Page::Variants])
        end
        def self.variants
        end
      end

      # Specifies the corner radius for rounded corners (e.g., 20) or `max` for
      # circular/oval shapes.
      module Radius
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Float, Imagekit::Transformation::Radius::TaggedSymbol)
          end

        sig do
          override.returns(T::Array[Imagekit::Transformation::Radius::Variants])
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::Transformation::Radius) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MAX = T.let(:max, Imagekit::Transformation::Radius::TaggedSymbol)
      end

      # Specifies the rotation angle in degrees. Positive values rotate the image
      # clockwise; you can also use, for example, `N40` for counterclockwise rotation or
      # `auto` to use the orientation specified in the image's EXIF data. For videos,
      # only the following values are supported: 0, 90, 180, 270, or 360.
      module Rotation
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Rotation::Variants]
          )
        end
        def self.variants
        end
      end

      # Adds a shadow beneath solid objects in an image with a transparent background.
      # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      # shadow, or provide a string for a custom shadow.
      module Shadow
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Imagekit::Transformation::Shadow::TaggedBoolean, String)
          end

        sig do
          override.returns(T::Array[Imagekit::Transformation::Shadow::Variants])
        end
        def self.variants
        end

        TaggedBoolean =
          T.type_alias { T.all(T::Boolean, Imagekit::Transformation::Shadow) }
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::Shadow::TaggedBoolean)
      end

      # Sharpens the input image, highlighting edges and finer details. Pass `true` for
      # default sharpening, or provide a numeric value for custom sharpening.
      module Sharpen
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Imagekit::Transformation::Sharpen::TaggedBoolean, Float)
          end

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::Sharpen::Variants]
          )
        end
        def self.variants
        end

        TaggedBoolean =
          T.type_alias { T.all(T::Boolean, Imagekit::Transformation::Sharpen) }
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::Sharpen::TaggedBoolean)
      end

      # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      # `10.5`. Arithmetic expressions are also supported.
      module StartOffset
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::StartOffset::Variants]
          )
        end
        def self.variants
        end
      end

      # Useful for images with a solid or nearly solid background and a central object.
      # This parameter trims the background, leaving only the central object in the
      # output image.
      module Trim
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Imagekit::Transformation::Trim::TaggedBoolean, Float)
          end

        sig do
          override.returns(T::Array[Imagekit::Transformation::Trim::Variants])
        end
        def self.variants
        end

        TaggedBoolean =
          T.type_alias { T.all(T::Boolean, Imagekit::Transformation::Trim) }
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::Trim::TaggedBoolean)
      end

      # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      # default unsharp mask, or provide a string for a custom unsharp mask.
      module UnsharpMask
        extend Imagekit::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Imagekit::Transformation::UnsharpMask::TaggedBoolean, String)
          end

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::UnsharpMask::Variants]
          )
        end
        def self.variants
        end

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekit::Transformation::UnsharpMask)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekit::Transformation::UnsharpMask::TaggedBoolean)
      end

      # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`.
      module VideoCodec
        extend Imagekit::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekit::Transformation::VideoCodec) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        H264 = T.let(:h264, Imagekit::Transformation::VideoCodec::TaggedSymbol)
        VP9 = T.let(:vp9, Imagekit::Transformation::VideoCodec::TaggedSymbol)
        AV1 = T.let(:av1, Imagekit::Transformation::VideoCodec::TaggedSymbol)
        NONE = T.let(:none, Imagekit::Transformation::VideoCodec::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::VideoCodec::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the width of the output. If a value between 0 and 1 is provided, it is
      # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      # can also supply arithmetic expressions (e.g., `iw_div_2`).
      module Width
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::Transformation::Width::Variants])
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - X coordinate
      module X
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::Transformation::X::Variants])
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - X center coordinate
      module XCenter
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::XCenter::Variants]
          )
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - Y coordinate
      module Y
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekit::Transformation::Y::Variants])
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - Y center coordinate
      module YCenter
        extend Imagekit::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekit::Transformation::YCenter::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
