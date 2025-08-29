# frozen_string_literal: true

module Imagekit
  module Models
    class Transformation < Imagekit::Internal::Type::BaseModel
      # @!attribute ai_change_background
      #   Uses AI to change the background. Provide a text prompt or a base64-encoded
      #   prompt, e.g., `prompt-snow road` or `prompte-[urlencoded_base64_encoded_text]`.
      #   Not supported inside overlay.
      #
      #   @return [String, nil]
      optional :ai_change_background, String, api_name: :aiChangeBackground

      # @!attribute ai_drop_shadow
      #   Adds an AI-based drop shadow around a foreground object on a transparent or
      #   removed background. Optionally, control the direction, elevation, and saturation
      #   of the light source (e.g., `az-45` to change light direction). Pass `true` for
      #   the default drop shadow, or provide a string for a custom drop shadow. Supported
      #   inside overlay.
      #
      #   @return [Boolean, String, Imagekit::Models::Transformation::AIDropShadow, nil]
      optional :ai_drop_shadow, union: -> { Imagekit::Transformation::AIDropShadow }, api_name: :aiDropShadow

      # @!attribute ai_remove_background
      #   Applies ImageKit's in-house background removal. Supported inside overlay.
      #
      #   @return [Boolean, Imagekit::Models::Transformation::AIRemoveBackground, nil]
      optional :ai_remove_background,
               enum: -> { Imagekit::Transformation::AIRemoveBackground },
               api_name: :aiRemoveBackground

      # @!attribute ai_remove_background_external
      #   Uses third-party background removal. Note: It is recommended to use
      #   aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      #   Supported inside overlay.
      #
      #   @return [Boolean, Imagekit::Models::Transformation::AIRemoveBackgroundExternal, nil]
      optional :ai_remove_background_external,
               enum: -> { Imagekit::Transformation::AIRemoveBackgroundExternal },
               api_name: :aiRemoveBackgroundExternal

      # @!attribute ai_retouch
      #   Performs AI-based retouching to improve faces or product shots. Not supported
      #   inside overlay.
      #
      #   @return [Boolean, Imagekit::Models::Transformation::AIRetouch, nil]
      optional :ai_retouch, enum: -> { Imagekit::Transformation::AIRetouch }, api_name: :aiRetouch

      # @!attribute ai_upscale
      #   Upscales images beyond their original dimensions using AI. Not supported inside
      #   overlay.
      #
      #   @return [Boolean, Imagekit::Models::Transformation::AIUpscale, nil]
      optional :ai_upscale, enum: -> { Imagekit::Transformation::AIUpscale }, api_name: :aiUpscale

      # @!attribute ai_variation
      #   Generates a variation of an image using AI. This produces a new image with
      #   slight variations from the original, such as changes in color, texture, and
      #   other visual elements, while preserving the structure and essence of the
      #   original image. Not supported inside overlay.
      #
      #   @return [Boolean, Imagekit::Models::Transformation::AIVariation, nil]
      optional :ai_variation, enum: -> { Imagekit::Transformation::AIVariation }, api_name: :aiVariation

      # @!attribute aspect_ratio
      #   Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      #   either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      #   or an expression like `iar_div_2`.
      #
      #   @return [Float, String, nil]
      optional :aspect_ratio, union: -> { Imagekit::Transformation::AspectRatio }, api_name: :aspectRatio

      # @!attribute audio_codec
      #   Specifies the audio codec, e.g., `aac`, `opus`, or `none`.
      #
      #   @return [Symbol, Imagekit::Models::Transformation::AudioCodec, nil]
      optional :audio_codec, enum: -> { Imagekit::Transformation::AudioCodec }, api_name: :audioCodec

      # @!attribute background
      #   Specifies the background to be used in conjunction with certain cropping
      #   strategies when resizing an image.
      #
      #   - A solid color: e.g., `red`, `F3F3F3`, `AAFF0010`.
      #   - A blurred background: e.g., `blurred`, `blurred_25_N15`, etc.
      #   - Expand the image boundaries using generative fill: `genfill`. Not supported
      #     inside overlay. Optionally, control the background scene by passing a text
      #     prompt: `genfill[:-prompt-${text}]` or
      #     `genfill[:-prompte-${urlencoded_base64_encoded_text}]`.
      #
      #   @return [String, nil]
      optional :background, String

      # @!attribute blur
      #   Specifies the Gaussian blur level. Accepts an integer value between 1 and 100,
      #   or an expression like `bl-10`.
      #
      #   @return [Float, nil]
      optional :blur, Float

      # @!attribute border
      #   Adds a border to the output media. Accepts a string in the format
      #   `<border-width>_<hex-code>` (e.g., `5_FFF000` for a 5px yellow border), or an
      #   expression like `ih_div_20_FF00FF`.
      #
      #   @return [String, nil]
      optional :border, String

      # @!attribute color_profile
      #   Indicates whether the output image should retain the original color profile.
      #
      #   @return [Boolean, nil]
      optional :color_profile, Imagekit::Internal::Type::Boolean, api_name: :colorProfile

      # @!attribute contrast_stretch
      #   Automatically enhances the contrast of an image (contrast stretch).
      #
      #   @return [Boolean, Imagekit::Models::Transformation::ContrastStretch, nil]
      optional :contrast_stretch,
               enum: -> { Imagekit::Transformation::ContrastStretch },
               api_name: :contrastStretch

      # @!attribute crop
      #   Crop modes for image resizing
      #
      #   @return [Symbol, Imagekit::Models::Transformation::Crop, nil]
      optional :crop, enum: -> { Imagekit::Transformation::Crop }

      # @!attribute crop_mode
      #   Additional crop modes for image resizing
      #
      #   @return [Symbol, Imagekit::Models::Transformation::CropMode, nil]
      optional :crop_mode, enum: -> { Imagekit::Transformation::CropMode }, api_name: :cropMode

      # @!attribute default_image
      #   Specifies a fallback image if the resource is not found, e.g., a URL or file
      #   path.
      #
      #   @return [String, nil]
      optional :default_image, String, api_name: :defaultImage

      # @!attribute dpr
      #   Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio
      #   (DPR) calculation.
      #
      #   @return [Float, nil]
      optional :dpr, Float

      # @!attribute duration
      #   Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #   Typically used with startOffset to indicate the length from the start offset.
      #   Arithmetic expressions are supported.
      #
      #   @return [Float, String, nil]
      optional :duration, union: -> { Imagekit::Transformation::Duration }

      # @!attribute end_offset
      #   Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #   Typically used with startOffset to define a time window. Arithmetic expressions
      #   are supported.
      #
      #   @return [Float, String, nil]
      optional :end_offset, union: -> { Imagekit::Transformation::EndOffset }, api_name: :endOffset

      # @!attribute flip
      #   Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      #   values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      #   `v_h`.
      #
      #   @return [Symbol, Imagekit::Models::Transformation::Flip, nil]
      optional :flip, enum: -> { Imagekit::Transformation::Flip }

      # @!attribute focus
      #   This parameter can be used with pad resize, maintain ratio, or extract crop to
      #   modify the padding or cropping behavior.
      #
      #   @return [String, nil]
      optional :focus, String

      # @!attribute format_
      #   Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
      #   `mp4`, or `auto`. You can also pass `orig` for images to return the original
      #   format. ImageKit automatically delivers images and videos in the optimal format
      #   based on device support unless overridden by the dashboard settings or the
      #   format parameter.
      #
      #   @return [Symbol, Imagekit::Models::Transformation::Format, nil]
      optional :format_, enum: -> { Imagekit::Transformation::Format }, api_name: :format

      # @!attribute gradient
      #   Creates a linear gradient with two colors. Pass `true` for a default gradient,
      #   or provide a string for a custom gradient.
      #
      #   @return [Boolean, String, Imagekit::Models::Transformation::Gradient, nil]
      optional :gradient, union: -> { Imagekit::Transformation::Gradient }

      # @!attribute grayscale
      #   Enables a grayscale effect for images.
      #
      #   @return [Boolean, Imagekit::Models::Transformation::Grayscale, nil]
      optional :grayscale, enum: -> { Imagekit::Transformation::Grayscale }

      # @!attribute height
      #   Specifies the height of the output. If a value between 0 and 1 is provided, it
      #   is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      #   You can also supply arithmetic expressions (e.g., `ih_mul_0.5`).
      #
      #   @return [Float, String, nil]
      optional :height, union: -> { Imagekit::Transformation::Height }

      # @!attribute lossless
      #   Specifies whether the output image (in JPEG or PNG) should be compressed
      #   losslessly.
      #
      #   @return [Boolean, nil]
      optional :lossless, Imagekit::Internal::Type::Boolean

      # @!attribute metadata
      #   By default, ImageKit removes all metadata during automatic image compression.
      #   Set this to true to preserve metadata.
      #
      #   @return [Boolean, nil]
      optional :metadata, Imagekit::Internal::Type::Boolean

      # @!attribute named
      #   Named transformation reference
      #
      #   @return [String, nil]
      optional :named, String

      # @!attribute opacity
      #   Specifies the opacity level of the output image.
      #
      #   @return [Float, nil]
      optional :opacity, Float

      # @!attribute original
      #   If set to true, serves the original file without applying any transformations.
      #
      #   @return [Boolean, nil]
      optional :original, Imagekit::Internal::Type::Boolean

      # @!attribute overlay
      #   Specifies an overlay to be applied on the parent image or video. ImageKit
      #   supports overlays including images, text, videos, subtitles, and solid colors.
      #
      #   @return [Imagekit::Models::Overlay, nil]
      optional :overlay, union: -> { Imagekit::Overlay }

      # @!attribute page
      #   Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      #   AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      #   2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer).
      #
      #   @return [Float, String, nil]
      optional :page, union: -> { Imagekit::Transformation::Page }

      # @!attribute progressive
      #   Specifies whether the output JPEG image should be rendered progressively.
      #   Progressive loading begins with a low-quality, pixelated version of the full
      #   image, which gradually improves to provide a faster perceived load time.
      #
      #   @return [Boolean, nil]
      optional :progressive, Imagekit::Internal::Type::Boolean

      # @!attribute quality
      #   Specifies the quality of the output image for lossy formats such as JPEG, WebP,
      #   and AVIF. A higher quality value results in a larger file size with better
      #   quality, while a lower value produces a smaller file size with reduced quality.
      #
      #   @return [Float, nil]
      optional :quality, Float

      # @!attribute radius
      #   Specifies the corner radius for rounded corners (e.g., 20) or `max` for
      #   circular/oval shapes.
      #
      #   @return [Float, Symbol, Imagekit::Models::Transformation::Radius, nil]
      optional :radius, union: -> { Imagekit::Transformation::Radius }

      # @!attribute raw
      #   Pass any transformation not directly supported by the SDK. This transformation
      #   string is appended to the URL as provided.
      #
      #   @return [String, nil]
      optional :raw, String

      # @!attribute rotation
      #   Specifies the rotation angle in degrees. Positive values rotate the image
      #   clockwise; you can also use, for example, `N40` for counterclockwise rotation or
      #   `auto` to use the orientation specified in the image's EXIF data. For videos,
      #   only the following values are supported: 0, 90, 180, 270, or 360.
      #
      #   @return [Float, String, nil]
      optional :rotation, union: -> { Imagekit::Transformation::Rotation }

      # @!attribute shadow
      #   Adds a shadow beneath solid objects in an image with a transparent background.
      #   For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      #   shadow, or provide a string for a custom shadow.
      #
      #   @return [Boolean, String, Imagekit::Models::Transformation::Shadow, nil]
      optional :shadow, union: -> { Imagekit::Transformation::Shadow }

      # @!attribute sharpen
      #   Sharpens the input image, highlighting edges and finer details. Pass `true` for
      #   default sharpening, or provide a numeric value for custom sharpening.
      #
      #   @return [Boolean, Float, Imagekit::Models::Transformation::Sharpen, nil]
      optional :sharpen, union: -> { Imagekit::Transformation::Sharpen }

      # @!attribute start_offset
      #   Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      #   `10.5`. Arithmetic expressions are also supported.
      #
      #   @return [Float, String, nil]
      optional :start_offset, union: -> { Imagekit::Transformation::StartOffset }, api_name: :startOffset

      # @!attribute streaming_resolutions
      #   An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`,
      #   `480`, `720`, `1080`].
      #
      #   @return [Array<Symbol, Imagekit::Models::StreamingResolution>, nil]
      optional :streaming_resolutions,
               -> { Imagekit::Internal::Type::ArrayOf[enum: Imagekit::StreamingResolution] },
               api_name: :streamingResolutions

      # @!attribute trim
      #   Useful for images with a solid or nearly solid background and a central object.
      #   This parameter trims the background, leaving only the central object in the
      #   output image.
      #
      #   @return [Boolean, Float, Imagekit::Models::Transformation::Trim, nil]
      optional :trim, union: -> { Imagekit::Transformation::Trim }

      # @!attribute unsharp_mask
      #   Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      #   default unsharp mask, or provide a string for a custom unsharp mask.
      #
      #   @return [Boolean, String, Imagekit::Models::Transformation::UnsharpMask, nil]
      optional :unsharp_mask, union: -> { Imagekit::Transformation::UnsharpMask }, api_name: :unsharpMask

      # @!attribute video_codec
      #   Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`.
      #
      #   @return [Symbol, Imagekit::Models::Transformation::VideoCodec, nil]
      optional :video_codec, enum: -> { Imagekit::Transformation::VideoCodec }, api_name: :videoCodec

      # @!attribute width
      #   Specifies the width of the output. If a value between 0 and 1 is provided, it is
      #   treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      #   can also supply arithmetic expressions (e.g., `iw_div_2`).
      #
      #   @return [Float, String, nil]
      optional :width, union: -> { Imagekit::Transformation::Width }

      # @!attribute x
      #   Focus using cropped image coordinates - X coordinate
      #
      #   @return [Float, String, nil]
      optional :x, union: -> { Imagekit::Transformation::X }

      # @!attribute x_center
      #   Focus using cropped image coordinates - X center coordinate
      #
      #   @return [Float, String, nil]
      optional :x_center, union: -> { Imagekit::Transformation::XCenter }, api_name: :xCenter

      # @!attribute y_
      #   Focus using cropped image coordinates - Y coordinate
      #
      #   @return [Float, String, nil]
      optional :y_, union: -> { Imagekit::Transformation::Y }, api_name: :y

      # @!attribute y_center
      #   Focus using cropped image coordinates - Y center coordinate
      #
      #   @return [Float, String, nil]
      optional :y_center, union: -> { Imagekit::Transformation::YCenter }, api_name: :yCenter

      # @!attribute zoom
      #   Accepts a numeric value that determines how much to zoom in or out of the
      #   cropped area. It should be used in conjunction with fo-face or fo-<object_name>.
      #
      #   @return [Float, nil]
      optional :zoom, Float

      # @!method initialize(ai_change_background: nil, ai_drop_shadow: nil, ai_remove_background: nil, ai_remove_background_external: nil, ai_retouch: nil, ai_upscale: nil, ai_variation: nil, aspect_ratio: nil, audio_codec: nil, background: nil, blur: nil, border: nil, color_profile: nil, contrast_stretch: nil, crop: nil, crop_mode: nil, default_image: nil, dpr: nil, duration: nil, end_offset: nil, flip: nil, focus: nil, format_: nil, gradient: nil, grayscale: nil, height: nil, lossless: nil, metadata: nil, named: nil, opacity: nil, original: nil, overlay: nil, page: nil, progressive: nil, quality: nil, radius: nil, raw: nil, rotation: nil, shadow: nil, sharpen: nil, start_offset: nil, streaming_resolutions: nil, trim: nil, unsharp_mask: nil, video_codec: nil, width: nil, x: nil, x_center: nil, y_: nil, y_center: nil, zoom: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekit::Models::Transformation} for more details.
      #
      #   The SDK provides easy-to-use names for transformations. These names are
      #   converted to the corresponding transformation string before being added to the
      #   URL. SDKs are updated regularly to support new transformations. If you want to
      #   use a transformation that is not supported by the SDK, You can use the `raw`
      #   parameter to pass the transformation string directly.
      #
      #   @param ai_change_background [String] Uses AI to change the background. Provide a text prompt or a base64-encoded prom
      #
      #   @param ai_drop_shadow [Boolean, String, Imagekit::Models::Transformation::AIDropShadow] Adds an AI-based drop shadow around a foreground object on a transparent or remo
      #
      #   @param ai_remove_background [Boolean, Imagekit::Models::Transformation::AIRemoveBackground] Applies ImageKit's in-house background removal.
      #
      #   @param ai_remove_background_external [Boolean, Imagekit::Models::Transformation::AIRemoveBackgroundExternal] Uses third-party background removal.
      #
      #   @param ai_retouch [Boolean, Imagekit::Models::Transformation::AIRetouch] Performs AI-based retouching to improve faces or product shots. Not supported in
      #
      #   @param ai_upscale [Boolean, Imagekit::Models::Transformation::AIUpscale] Upscales images beyond their original dimensions using AI. Not supported inside
      #
      #   @param ai_variation [Boolean, Imagekit::Models::Transformation::AIVariation] Generates a variation of an image using AI. This produces a new image with sligh
      #
      #   @param aspect_ratio [Float, String] Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with e
      #
      #   @param audio_codec [Symbol, Imagekit::Models::Transformation::AudioCodec] Specifies the audio codec, e.g., `aac`, `opus`, or `none`.
      #
      #   @param background [String] Specifies the background to be used in conjunction with certain cropping strateg
      #
      #   @param blur [Float] Specifies the Gaussian blur level. Accepts an integer value between 1 and 100, o
      #
      #   @param border [String] Adds a border to the output media. Accepts a string in the format `<border-width
      #
      #   @param color_profile [Boolean] Indicates whether the output image should retain the original color profile.
      #
      #   @param contrast_stretch [Boolean, Imagekit::Models::Transformation::ContrastStretch] Automatically enhances the contrast of an image (contrast stretch).
      #
      #   @param crop [Symbol, Imagekit::Models::Transformation::Crop] Crop modes for image resizing
      #
      #   @param crop_mode [Symbol, Imagekit::Models::Transformation::CropMode] Additional crop modes for image resizing
      #
      #   @param default_image [String] Specifies a fallback image if the resource is not found, e.g., a URL or file pat
      #
      #   @param dpr [Float] Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio (DP
      #
      #   @param duration [Float, String] Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #
      #   @param end_offset [Float, String] Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #
      #   @param flip [Symbol, Imagekit::Models::Transformation::Flip] Flips or mirrors an image either horizontally, vertically, or both.
      #
      #   @param focus [String] This parameter can be used with pad resize, maintain ratio, or extract crop to m
      #
      #   @param format_ [Symbol, Imagekit::Models::Transformation::Format] Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`, `m
      #
      #   @param gradient [Boolean, String, Imagekit::Models::Transformation::Gradient] Creates a linear gradient with two colors. Pass `true` for a default gradient, o
      #
      #   @param grayscale [Boolean, Imagekit::Models::Transformation::Grayscale] Enables a grayscale effect for images.
      #
      #   @param height [Float, String] Specifies the height of the output. If a value between 0 and 1 is provided, it i
      #
      #   @param lossless [Boolean] Specifies whether the output image (in JPEG or PNG) should be compressed lossles
      #
      #   @param metadata [Boolean] By default, ImageKit removes all metadata during automatic image compression.
      #
      #   @param named [String] Named transformation reference
      #
      #   @param opacity [Float] Specifies the opacity level of the output image.
      #
      #   @param original [Boolean] If set to true, serves the original file without applying any transformations.
      #
      #   @param overlay [Imagekit::Models::Overlay] Specifies an overlay to be applied on the parent image or video.
      #
      #   @param page [Float, String] Extracts a specific page or frame from multi-page or layered files (PDF, PSD, AI
      #
      #   @param progressive [Boolean] Specifies whether the output JPEG image should be rendered progressively. Progre
      #
      #   @param quality [Float] Specifies the quality of the output image for lossy formats such as JPEG, WebP,
      #
      #   @param radius [Float, Symbol, Imagekit::Models::Transformation::Radius] Specifies the corner radius for rounded corners (e.g., 20) or `max` for circular
      #
      #   @param raw [String] Pass any transformation not directly supported by the SDK.
      #
      #   @param rotation [Float, String] Specifies the rotation angle in degrees. Positive values rotate the image clockw
      #
      #   @param shadow [Boolean, String, Imagekit::Models::Transformation::Shadow] Adds a shadow beneath solid objects in an image with a transparent background.
      #
      #   @param sharpen [Boolean, Float, Imagekit::Models::Transformation::Sharpen] Sharpens the input image, highlighting edges and finer details.
      #
      #   @param start_offset [Float, String] Specifies the start offset (in seconds) for trimming videos, e.g., `5` or `10.5`
      #
      #   @param streaming_resolutions [Array<Symbol, Imagekit::Models::StreamingResolution>] An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`, `48
      #
      #   @param trim [Boolean, Float, Imagekit::Models::Transformation::Trim] Useful for images with a solid or nearly solid background and a central object.
      #
      #   @param unsharp_mask [Boolean, String, Imagekit::Models::Transformation::UnsharpMask] Applies Unsharp Masking (USM), an image sharpening technique.
      #
      #   @param video_codec [Symbol, Imagekit::Models::Transformation::VideoCodec] Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`.
      #
      #   @param width [Float, String] Specifies the width of the output. If a value between 0 and 1 is provided, it is
      #
      #   @param x [Float, String] Focus using cropped image coordinates - X coordinate
      #
      #   @param x_center [Float, String] Focus using cropped image coordinates - X center coordinate
      #
      #   @param y_ [Float, String] Focus using cropped image coordinates - Y coordinate
      #
      #   @param y_center [Float, String] Focus using cropped image coordinates - Y center coordinate
      #
      #   @param zoom [Float] Accepts a numeric value that determines how much to zoom in or out of the croppe

      # Adds an AI-based drop shadow around a foreground object on a transparent or
      # removed background. Optionally, control the direction, elevation, and saturation
      # of the light source (e.g., `az-45` to change light direction). Pass `true` for
      # the default drop shadow, or provide a string for a custom drop shadow. Supported
      # inside overlay.
      #
      # @see Imagekit::Models::Transformation#ai_drop_shadow
      module AIDropShadow
        extend Imagekit::Internal::Type::Union

        variant const: -> { Imagekit::Models::Transformation::AIDropShadow::TRUE }

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Imagekit::Transformation::AIDropShadow::TaggedBoolean, String) }
        end

        # @!group

        TRUE = true

        # @!endgroup
      end

      # Applies ImageKit's in-house background removal. Supported inside overlay.
      #
      # @see Imagekit::Models::Transformation#ai_remove_background
      module AIRemoveBackground
        extend Imagekit::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Uses third-party background removal. Note: It is recommended to use
      # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      # Supported inside overlay.
      #
      # @see Imagekit::Models::Transformation#ai_remove_background_external
      module AIRemoveBackgroundExternal
        extend Imagekit::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Performs AI-based retouching to improve faces or product shots. Not supported
      # inside overlay.
      #
      # @see Imagekit::Models::Transformation#ai_retouch
      module AIRetouch
        extend Imagekit::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Upscales images beyond their original dimensions using AI. Not supported inside
      # overlay.
      #
      # @see Imagekit::Models::Transformation#ai_upscale
      module AIUpscale
        extend Imagekit::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Generates a variation of an image using AI. This produces a new image with
      # slight variations from the original, such as changes in color, texture, and
      # other visual elements, while preserving the structure and essence of the
      # original image. Not supported inside overlay.
      #
      # @see Imagekit::Models::Transformation#ai_variation
      module AIVariation
        extend Imagekit::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      # or an expression like `iar_div_2`.
      #
      # @see Imagekit::Models::Transformation#aspect_ratio
      module AspectRatio
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the audio codec, e.g., `aac`, `opus`, or `none`.
      #
      # @see Imagekit::Models::Transformation#audio_codec
      module AudioCodec
        extend Imagekit::Internal::Type::Enum

        AAC = :aac
        OPUS = :opus
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Automatically enhances the contrast of an image (contrast stretch).
      #
      # @see Imagekit::Models::Transformation#contrast_stretch
      module ContrastStretch
        extend Imagekit::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Crop modes for image resizing
      #
      # @see Imagekit::Models::Transformation#crop
      module Crop
        extend Imagekit::Internal::Type::Enum

        FORCE = :force
        AT_MAX = :at_max
        AT_MAX_ENLARGE = :at_max_enlarge
        AT_LEAST = :at_least
        MAINTAIN_RATIO = :maintain_ratio

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Additional crop modes for image resizing
      #
      # @see Imagekit::Models::Transformation#crop_mode
      module CropMode
        extend Imagekit::Internal::Type::Enum

        PAD_RESIZE = :pad_resize
        EXTRACT = :extract
        PAD_EXTRACT = :pad_extract

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to indicate the length from the start offset.
      # Arithmetic expressions are supported.
      #
      # @see Imagekit::Models::Transformation#duration
      module Duration
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to define a time window. Arithmetic expressions
      # are supported.
      #
      # @see Imagekit::Models::Transformation#end_offset
      module EndOffset
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      # `v_h`.
      #
      # @see Imagekit::Models::Transformation#flip
      module Flip
        extend Imagekit::Internal::Type::Enum

        H = :h
        V = :v
        H_V = :h_v
        V_H = :v_h

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
      # `mp4`, or `auto`. You can also pass `orig` for images to return the original
      # format. ImageKit automatically delivers images and videos in the optimal format
      # based on device support unless overridden by the dashboard settings or the
      # format parameter.
      #
      # @see Imagekit::Models::Transformation#format_
      module Format
        extend Imagekit::Internal::Type::Enum

        AUTO = :auto
        WEBP = :webp
        JPG = :jpg
        JPEG = :jpeg
        PNG = :png
        GIF = :gif
        SVG = :svg
        MP4 = :mp4
        WEBM = :webm
        AVIF = :avif
        ORIG = :orig

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient.
      #
      # @see Imagekit::Models::Transformation#gradient
      module Gradient
        extend Imagekit::Internal::Type::Union

        variant const: -> { Imagekit::Models::Transformation::Gradient::TRUE }

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Imagekit::Transformation::Gradient::TaggedBoolean, String) }
        end

        # @!group

        TRUE = true

        # @!endgroup
      end

      # Enables a grayscale effect for images.
      #
      # @see Imagekit::Models::Transformation#grayscale
      module Grayscale
        extend Imagekit::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Specifies the height of the output. If a value between 0 and 1 is provided, it
      # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`).
      #
      # @see Imagekit::Models::Transformation#height
      module Height
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer).
      #
      # @see Imagekit::Models::Transformation#page
      module Page
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the corner radius for rounded corners (e.g., 20) or `max` for
      # circular/oval shapes.
      #
      # @see Imagekit::Models::Transformation#radius
      module Radius
        extend Imagekit::Internal::Type::Union

        variant Float

        variant const: -> { Imagekit::Models::Transformation::Radius::MAX }

        # @!method self.variants
        #   @return [Array(Float, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Float, Imagekit::Transformation::Radius::TaggedSymbol) }
        end

        # @!group

        MAX = :max

        # @!endgroup
      end

      # Specifies the rotation angle in degrees. Positive values rotate the image
      # clockwise; you can also use, for example, `N40` for counterclockwise rotation or
      # `auto` to use the orientation specified in the image's EXIF data. For videos,
      # only the following values are supported: 0, 90, 180, 270, or 360.
      #
      # @see Imagekit::Models::Transformation#rotation
      module Rotation
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Adds a shadow beneath solid objects in an image with a transparent background.
      # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      # shadow, or provide a string for a custom shadow.
      #
      # @see Imagekit::Models::Transformation#shadow
      module Shadow
        extend Imagekit::Internal::Type::Union

        variant const: -> { Imagekit::Models::Transformation::Shadow::TRUE }

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Imagekit::Transformation::Shadow::TaggedBoolean, String) }
        end

        # @!group

        TRUE = true

        # @!endgroup
      end

      # Sharpens the input image, highlighting edges and finer details. Pass `true` for
      # default sharpening, or provide a numeric value for custom sharpening.
      #
      # @see Imagekit::Models::Transformation#sharpen
      module Sharpen
        extend Imagekit::Internal::Type::Union

        variant const: -> { Imagekit::Models::Transformation::Sharpen::TRUE }

        variant Float

        # @!method self.variants
        #   @return [Array(Boolean, Float)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Imagekit::Transformation::Sharpen::TaggedBoolean, Float) }
        end

        # @!group

        TRUE = true

        # @!endgroup
      end

      # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      # `10.5`. Arithmetic expressions are also supported.
      #
      # @see Imagekit::Models::Transformation#start_offset
      module StartOffset
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Useful for images with a solid or nearly solid background and a central object.
      # This parameter trims the background, leaving only the central object in the
      # output image.
      #
      # @see Imagekit::Models::Transformation#trim
      module Trim
        extend Imagekit::Internal::Type::Union

        variant const: -> { Imagekit::Models::Transformation::Trim::TRUE }

        variant Float

        # @!method self.variants
        #   @return [Array(Boolean, Float)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Imagekit::Transformation::Trim::TaggedBoolean, Float) }
        end

        # @!group

        TRUE = true

        # @!endgroup
      end

      # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      # default unsharp mask, or provide a string for a custom unsharp mask.
      #
      # @see Imagekit::Models::Transformation#unsharp_mask
      module UnsharpMask
        extend Imagekit::Internal::Type::Union

        variant const: -> { Imagekit::Models::Transformation::UnsharpMask::TRUE }

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Imagekit::Transformation::UnsharpMask::TaggedBoolean, String) }
        end

        # @!group

        TRUE = true

        # @!endgroup
      end

      # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`.
      #
      # @see Imagekit::Models::Transformation#video_codec
      module VideoCodec
        extend Imagekit::Internal::Type::Enum

        H264 = :h264
        VP9 = :vp9
        AV1 = :av1
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the width of the output. If a value between 0 and 1 is provided, it is
      # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      # can also supply arithmetic expressions (e.g., `iw_div_2`).
      #
      # @see Imagekit::Models::Transformation#width
      module Width
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - X coordinate
      #
      # @see Imagekit::Models::Transformation#x
      module X
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - X center coordinate
      #
      # @see Imagekit::Models::Transformation#x_center
      module XCenter
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - Y coordinate
      #
      # @see Imagekit::Models::Transformation#y_
      module Y
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - Y center coordinate
      #
      # @see Imagekit::Models::Transformation#y_center
      module YCenter
        extend Imagekit::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
