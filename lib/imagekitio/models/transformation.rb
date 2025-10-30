# frozen_string_literal: true

module Imagekitio
  module Models
    class Transformation < Imagekitio::Internal::Type::BaseModel
      # @!attribute ai_change_background
      #   Uses AI to change the background. Provide a text prompt or a base64-encoded
      #   prompt, e.g., `prompt-snow road` or `prompte-[urlencoded_base64_encoded_text]`.
      #   Not supported inside overlay. See
      #   [AI Change Background](https://imagekit.io/docs/ai-transformations#change-background-e-changebg).
      #
      #   @return [String, nil]
      optional :ai_change_background, String, api_name: :aiChangeBackground

      # @!attribute ai_drop_shadow
      #   Adds an AI-based drop shadow around a foreground object on a transparent or
      #   removed background. Optionally, control the direction, elevation, and saturation
      #   of the light source (e.g., `az-45` to change light direction). Pass `true` for
      #   the default drop shadow, or provide a string for a custom drop shadow. Supported
      #   inside overlay. See
      #   [AI Drop Shadow](https://imagekit.io/docs/ai-transformations#ai-drop-shadow-e-dropshadow).
      #
      #   @return [Boolean, true, String, nil]
      optional :ai_drop_shadow,
               union: -> {
                 Imagekitio::Transformation::AIDropShadow
               },
               api_name: :aiDropShadow

      # @!attribute ai_edit
      #   Uses AI to edit images based on a text prompt. Provide a text prompt or a
      #   base64-encoded prompt, e.g., `prompt-snow road` or
      #   `prompte-[urlencoded_base64_encoded_text]`. Not supported inside overlay.
      #   See [AI Edit](https://imagekit.io/docs/ai-transformations#edit-image-e-edit).
      #
      #   @return [String, nil]
      optional :ai_edit, String, api_name: :aiEdit

      # @!attribute ai_remove_background
      #   Applies ImageKit's in-house background removal. Supported inside overlay. See
      #   [AI Background Removal](https://imagekit.io/docs/ai-transformations#imagekit-background-removal-e-bgremove).
      #
      #   @return [Boolean, Imagekitio::Models::Transformation::AIRemoveBackground, nil]
      optional :ai_remove_background,
               enum: -> { Imagekitio::Transformation::AIRemoveBackground },
               api_name: :aiRemoveBackground

      # @!attribute ai_remove_background_external
      #   Uses third-party background removal. Note: It is recommended to use
      #   aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      #   Supported inside overlay. See
      #   [External Background Removal](https://imagekit.io/docs/ai-transformations#background-removal-e-removedotbg).
      #
      #   @return [Boolean, Imagekitio::Models::Transformation::AIRemoveBackgroundExternal, nil]
      optional :ai_remove_background_external,
               enum: -> { Imagekitio::Transformation::AIRemoveBackgroundExternal },
               api_name: :aiRemoveBackgroundExternal

      # @!attribute ai_retouch
      #   Performs AI-based retouching to improve faces or product shots. Not supported
      #   inside overlay. See
      #   [AI Retouch](https://imagekit.io/docs/ai-transformations#retouch-e-retouch).
      #
      #   @return [Boolean, Imagekitio::Models::Transformation::AIRetouch, nil]
      optional :ai_retouch, enum: -> { Imagekitio::Transformation::AIRetouch }, api_name: :aiRetouch

      # @!attribute ai_upscale
      #   Upscales images beyond their original dimensions using AI. Not supported inside
      #   overlay. See
      #   [AI Upscale](https://imagekit.io/docs/ai-transformations#upscale-e-upscale).
      #
      #   @return [Boolean, Imagekitio::Models::Transformation::AIUpscale, nil]
      optional :ai_upscale, enum: -> { Imagekitio::Transformation::AIUpscale }, api_name: :aiUpscale

      # @!attribute ai_variation
      #   Generates a variation of an image using AI. This produces a new image with
      #   slight variations from the original, such as changes in color, texture, and
      #   other visual elements, while preserving the structure and essence of the
      #   original image. Not supported inside overlay. See
      #   [AI Generate Variations](https://imagekit.io/docs/ai-transformations#generate-variations-of-an-image-e-genvar).
      #
      #   @return [Boolean, Imagekitio::Models::Transformation::AIVariation, nil]
      optional :ai_variation, enum: -> { Imagekitio::Transformation::AIVariation }, api_name: :aiVariation

      # @!attribute aspect_ratio
      #   Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      #   either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      #   or an expression like `iar_div_2`. See
      #   [Image resize and crop – Aspect ratio](https://imagekit.io/docs/image-resize-and-crop#aspect-ratio---ar).
      #
      #   @return [Float, String, nil]
      optional :aspect_ratio, union: -> { Imagekitio::Transformation::AspectRatio }, api_name: :aspectRatio

      # @!attribute audio_codec
      #   Specifies the audio codec, e.g., `aac`, `opus`, or `none`. See
      #   [Audio codec](https://imagekit.io/docs/video-optimization#audio-codec---ac).
      #
      #   @return [Symbol, Imagekitio::Models::Transformation::AudioCodec, nil]
      optional :audio_codec, enum: -> { Imagekitio::Transformation::AudioCodec }, api_name: :audioCodec

      # @!attribute background
      #   Specifies the background to be used in conjunction with certain cropping
      #   strategies when resizing an image.
      #
      #   - A solid color: e.g., `red`, `F3F3F3`, `AAFF0010`. See
      #     [Solid color background](https://imagekit.io/docs/effects-and-enhancements#solid-color-background).
      #   - A blurred background: e.g., `blurred`, `blurred_25_N15`, etc. See
      #     [Blurred background](https://imagekit.io/docs/effects-and-enhancements#blurred-background).
      #   - Expand the image boundaries using generative fill: `genfill`. Not supported
      #     inside overlay. Optionally, control the background scene by passing a text
      #     prompt: `genfill[:-prompt-${text}]` or
      #     `genfill[:-prompte-${urlencoded_base64_encoded_text}]`. See
      #     [Generative fill background](https://imagekit.io/docs/ai-transformations#generative-fill-bg-genfill).
      #
      #   @return [String, nil]
      optional :background, String

      # @!attribute blur
      #   Specifies the Gaussian blur level. Accepts an integer value between 1 and 100,
      #   or an expression like `bl-10`. See
      #   [Blur](https://imagekit.io/docs/effects-and-enhancements#blur---bl).
      #
      #   @return [Float, nil]
      optional :blur, Float

      # @!attribute border
      #   Adds a border to the output media. Accepts a string in the format
      #   `<border-width>_<hex-code>` (e.g., `5_FFF000` for a 5px yellow border), or an
      #   expression like `ih_div_20_FF00FF`. See
      #   [Border](https://imagekit.io/docs/effects-and-enhancements#border---b).
      #
      #   @return [String, nil]
      optional :border, String

      # @!attribute color_profile
      #   Indicates whether the output image should retain the original color profile. See
      #   [Color profile](https://imagekit.io/docs/image-optimization#color-profile---cp).
      #
      #   @return [Boolean, nil]
      optional :color_profile, Imagekitio::Internal::Type::Boolean, api_name: :colorProfile

      # @!attribute contrast_stretch
      #   Automatically enhances the contrast of an image (contrast stretch). See
      #   [Contrast Stretch](https://imagekit.io/docs/effects-and-enhancements#contrast-stretch---e-contrast).
      #
      #   @return [Boolean, Imagekitio::Models::Transformation::ContrastStretch, nil]
      optional :contrast_stretch,
               enum: -> { Imagekitio::Transformation::ContrastStretch },
               api_name: :contrastStretch

      # @!attribute crop
      #   Crop modes for image resizing. See
      #   [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      #
      #   @return [Symbol, Imagekitio::Models::Transformation::Crop, nil]
      optional :crop, enum: -> { Imagekitio::Transformation::Crop }

      # @!attribute crop_mode
      #   Additional crop modes for image resizing. See
      #   [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      #
      #   @return [Symbol, Imagekitio::Models::Transformation::CropMode, nil]
      optional :crop_mode, enum: -> { Imagekitio::Transformation::CropMode }, api_name: :cropMode

      # @!attribute default_image
      #   Specifies a fallback image if the resource is not found, e.g., a URL or file
      #   path. See
      #   [Default image](https://imagekit.io/docs/image-transformation#default-image---di).
      #
      #   @return [String, nil]
      optional :default_image, String, api_name: :defaultImage

      # @!attribute dpr
      #   Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio
      #   (DPR) calculation. See
      #   [DPR](https://imagekit.io/docs/image-resize-and-crop#dpr---dpr).
      #
      #   @return [Float, nil]
      optional :dpr, Float

      # @!attribute duration
      #   Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #   Typically used with startOffset to indicate the length from the start offset.
      #   Arithmetic expressions are supported. See
      #   [Trim videos – Duration](https://imagekit.io/docs/trim-videos#duration---du).
      #
      #   @return [Float, String, nil]
      optional :duration, union: -> { Imagekitio::Transformation::Duration }

      # @!attribute end_offset
      #   Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #   Typically used with startOffset to define a time window. Arithmetic expressions
      #   are supported. See
      #   [Trim videos – End offset](https://imagekit.io/docs/trim-videos#end-offset---eo).
      #
      #   @return [Float, String, nil]
      optional :end_offset, union: -> { Imagekitio::Transformation::EndOffset }, api_name: :endOffset

      # @!attribute flip
      #   Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      #   values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      #   `v_h`. See [Flip](https://imagekit.io/docs/effects-and-enhancements#flip---fl).
      #
      #   @return [Symbol, Imagekitio::Models::Transformation::Flip, nil]
      optional :flip, enum: -> { Imagekitio::Transformation::Flip }

      # @!attribute focus
      #   Refines padding and cropping behavior for pad resize, maintain ratio, and
      #   extract crop modes. Supports manual positions and coordinate-based focus. With
      #   AI-based cropping, you can automatically keep key subjects in frame—such as
      #   faces or detected objects (e.g., `fo-face`, `fo-person`, `fo-car`)— while
      #   resizing.
      #
      #   - See [Focus](https://imagekit.io/docs/image-resize-and-crop#focus---fo).
      #   - [Object aware cropping](https://imagekit.io/docs/image-resize-and-crop#object-aware-cropping---fo-object-name)
      #
      #   @return [String, nil]
      optional :focus, String

      # @!attribute format_
      #   Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
      #   `mp4`, or `auto`. You can also pass `orig` for images to return the original
      #   format. ImageKit automatically delivers images and videos in the optimal format
      #   based on device support unless overridden by the dashboard settings or the
      #   format parameter. See
      #   [Image format](https://imagekit.io/docs/image-optimization#format---f) and
      #   [Video format](https://imagekit.io/docs/video-optimization#format---f).
      #
      #   @return [Symbol, Imagekitio::Models::Transformation::Format, nil]
      optional :format_, enum: -> { Imagekitio::Transformation::Format }, api_name: :format

      # @!attribute gradient
      #   Creates a linear gradient with two colors. Pass `true` for a default gradient,
      #   or provide a string for a custom gradient. See
      #   [Gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      #
      #   @return [Boolean, true, String, nil]
      optional :gradient, union: -> { Imagekitio::Transformation::Gradient }

      # @!attribute grayscale
      #   Enables a grayscale effect for images. See
      #   [Grayscale](https://imagekit.io/docs/effects-and-enhancements#grayscale---e-grayscale).
      #
      #   @return [Boolean, Imagekitio::Models::Transformation::Grayscale, nil]
      optional :grayscale, enum: -> { Imagekitio::Transformation::Grayscale }

      # @!attribute height
      #   Specifies the height of the output. If a value between 0 and 1 is provided, it
      #   is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      #   You can also supply arithmetic expressions (e.g., `ih_mul_0.5`). Height
      #   transformation –
      #   [Images](https://imagekit.io/docs/image-resize-and-crop#height---h) ·
      #   [Videos](https://imagekit.io/docs/video-resize-and-crop#height---h)
      #
      #   @return [Float, String, nil]
      optional :height, union: -> { Imagekitio::Transformation::Height }

      # @!attribute lossless
      #   Specifies whether the output image (in JPEG or PNG) should be compressed
      #   losslessly. See
      #   [Lossless compression](https://imagekit.io/docs/image-optimization#lossless-webp-and-png---lo).
      #
      #   @return [Boolean, nil]
      optional :lossless, Imagekitio::Internal::Type::Boolean

      # @!attribute metadata
      #   By default, ImageKit removes all metadata during automatic image compression.
      #   Set this to true to preserve metadata. See
      #   [Image metadata](https://imagekit.io/docs/image-optimization#image-metadata---md).
      #
      #   @return [Boolean, nil]
      optional :metadata, Imagekitio::Internal::Type::Boolean

      # @!attribute named
      #   Named transformation reference. See
      #   [Named transformations](https://imagekit.io/docs/transformations#named-transformations).
      #
      #   @return [String, nil]
      optional :named, String

      # @!attribute opacity
      #   Specifies the opacity level of the output image. See
      #   [Opacity](https://imagekit.io/docs/effects-and-enhancements#opacity---o).
      #
      #   @return [Float, nil]
      optional :opacity, Float

      # @!attribute original
      #   If set to true, serves the original file without applying any transformations.
      #   See
      #   [Deliver original file as-is](https://imagekit.io/docs/core-delivery-features#deliver-original-file-as-is---orig-true).
      #
      #   @return [Boolean, nil]
      optional :original, Imagekitio::Internal::Type::Boolean

      # @!attribute overlay
      #   Specifies an overlay to be applied on the parent image or video. ImageKit
      #   supports overlays including images, text, videos, subtitles, and solid colors.
      #   See
      #   [Overlay using layers](https://imagekit.io/docs/transformations#overlay-using-layers).
      #
      #   @return [Imagekitio::Models::Overlay, nil]
      optional :overlay, union: -> { Imagekitio::Overlay }

      # @!attribute page
      #   Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      #   AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      #   2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer). See
      #   [Thumbnail extraction](https://imagekit.io/docs/vector-and-animated-images#get-thumbnail-from-psd-pdf-ai-eps-and-animated-files).
      #
      #   @return [Float, String, nil]
      optional :page, union: -> { Imagekitio::Transformation::Page }

      # @!attribute progressive
      #   Specifies whether the output JPEG image should be rendered progressively.
      #   Progressive loading begins with a low-quality, pixelated version of the full
      #   image, which gradually improves to provide a faster perceived load time. See
      #   [Progressive images](https://imagekit.io/docs/image-optimization#progressive-image---pr).
      #
      #   @return [Boolean, nil]
      optional :progressive, Imagekitio::Internal::Type::Boolean

      # @!attribute quality
      #   Specifies the quality of the output image for lossy formats such as JPEG, WebP,
      #   and AVIF. A higher quality value results in a larger file size with better
      #   quality, while a lower value produces a smaller file size with reduced quality.
      #   See [Quality](https://imagekit.io/docs/image-optimization#quality---q).
      #
      #   @return [Float, nil]
      optional :quality, Float

      # @!attribute radius
      #   Specifies the corner radius for rounded corners (e.g., 20) or `max` for circular
      #   or oval shape. See
      #   [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      #   @return [Float, Symbol, :max, nil]
      optional :radius, union: -> { Imagekitio::Transformation::Radius }

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
      #   only the following values are supported: 0, 90, 180, 270, or 360. See
      #   [Rotate](https://imagekit.io/docs/effects-and-enhancements#rotate---rt).
      #
      #   @return [Float, String, nil]
      optional :rotation, union: -> { Imagekitio::Transformation::Rotation }

      # @!attribute shadow
      #   Adds a shadow beneath solid objects in an image with a transparent background.
      #   For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      #   shadow, or provide a string for a custom shadow. See
      #   [Shadow](https://imagekit.io/docs/effects-and-enhancements#shadow---e-shadow).
      #
      #   @return [Boolean, true, String, nil]
      optional :shadow, union: -> { Imagekitio::Transformation::Shadow }

      # @!attribute sharpen
      #   Sharpens the input image, highlighting edges and finer details. Pass `true` for
      #   default sharpening, or provide a numeric value for custom sharpening. See
      #   [Sharpen](https://imagekit.io/docs/effects-and-enhancements#sharpen---e-sharpen).
      #
      #   @return [Boolean, true, Float, nil]
      optional :sharpen, union: -> { Imagekitio::Transformation::Sharpen }

      # @!attribute start_offset
      #   Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      #   `10.5`. Arithmetic expressions are also supported. See
      #   [Trim videos – Start offset](https://imagekit.io/docs/trim-videos#start-offset---so).
      #
      #   @return [Float, String, nil]
      optional :start_offset, union: -> { Imagekitio::Transformation::StartOffset }, api_name: :startOffset

      # @!attribute streaming_resolutions
      #   An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`,
      #   `480`, `720`, `1080`]. See
      #   [Adaptive Bitrate Streaming](https://imagekit.io/docs/adaptive-bitrate-streaming).
      #
      #   @return [Array<Symbol, Imagekitio::Models::StreamingResolution>, nil]
      optional :streaming_resolutions,
               -> { Imagekitio::Internal::Type::ArrayOf[enum: Imagekitio::StreamingResolution] },
               api_name: :streamingResolutions

      # @!attribute trim
      #   Useful for images with a solid or nearly solid background and a central object.
      #   This parameter trims the background, leaving only the central object in the
      #   output image. See
      #   [Trim edges](https://imagekit.io/docs/effects-and-enhancements#trim-edges---t).
      #
      #   @return [Boolean, true, Float, nil]
      optional :trim, union: -> { Imagekitio::Transformation::Trim }

      # @!attribute unsharp_mask
      #   Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      #   default unsharp mask, or provide a string for a custom unsharp mask. See
      #   [Unsharp Mask](https://imagekit.io/docs/effects-and-enhancements#unsharp-mask---e-usm).
      #
      #   @return [Boolean, true, String, nil]
      optional :unsharp_mask, union: -> { Imagekitio::Transformation::UnsharpMask }, api_name: :unsharpMask

      # @!attribute video_codec
      #   Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`. See
      #   [Video codec](https://imagekit.io/docs/video-optimization#video-codec---vc).
      #
      #   @return [Symbol, Imagekitio::Models::Transformation::VideoCodec, nil]
      optional :video_codec, enum: -> { Imagekitio::Transformation::VideoCodec }, api_name: :videoCodec

      # @!attribute width
      #   Specifies the width of the output. If a value between 0 and 1 is provided, it is
      #   treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      #   can also supply arithmetic expressions (e.g., `iw_div_2`). Width transformation
      #   – [Images](https://imagekit.io/docs/image-resize-and-crop#width---w) ·
      #   [Videos](https://imagekit.io/docs/video-resize-and-crop#width---w)
      #
      #   @return [Float, String, nil]
      optional :width, union: -> { Imagekitio::Transformation::Width }

      # @!attribute x
      #   Focus using cropped image coordinates - X coordinate. See
      #   [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      #   @return [Float, String, nil]
      optional :x, union: -> { Imagekitio::Transformation::X }

      # @!attribute x_center
      #   Focus using cropped image coordinates - X center coordinate. See
      #   [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      #   @return [Float, String, nil]
      optional :x_center, union: -> { Imagekitio::Transformation::XCenter }, api_name: :xCenter

      # @!attribute y_
      #   Focus using cropped image coordinates - Y coordinate. See
      #   [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      #   @return [Float, String, nil]
      optional :y_, union: -> { Imagekitio::Transformation::Y }, api_name: :y

      # @!attribute y_center
      #   Focus using cropped image coordinates - Y center coordinate. See
      #   [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      #   @return [Float, String, nil]
      optional :y_center, union: -> { Imagekitio::Transformation::YCenter }, api_name: :yCenter

      # @!attribute zoom
      #   Accepts a numeric value that determines how much to zoom in or out of the
      #   cropped area. It should be used in conjunction with fo-face or fo-<object_name>.
      #   See [Zoom](https://imagekit.io/docs/image-resize-and-crop#zoom---z).
      #
      #   @return [Float, nil]
      optional :zoom, Float

      # @!method initialize(ai_change_background: nil, ai_drop_shadow: nil, ai_edit: nil, ai_remove_background: nil, ai_remove_background_external: nil, ai_retouch: nil, ai_upscale: nil, ai_variation: nil, aspect_ratio: nil, audio_codec: nil, background: nil, blur: nil, border: nil, color_profile: nil, contrast_stretch: nil, crop: nil, crop_mode: nil, default_image: nil, dpr: nil, duration: nil, end_offset: nil, flip: nil, focus: nil, format_: nil, gradient: nil, grayscale: nil, height: nil, lossless: nil, metadata: nil, named: nil, opacity: nil, original: nil, overlay: nil, page: nil, progressive: nil, quality: nil, radius: nil, raw: nil, rotation: nil, shadow: nil, sharpen: nil, start_offset: nil, streaming_resolutions: nil, trim: nil, unsharp_mask: nil, video_codec: nil, width: nil, x: nil, x_center: nil, y_: nil, y_center: nil, zoom: nil)
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::Transformation} for more details.
      #
      #   The SDK provides easy-to-use names for transformations. These names are
      #   converted to the corresponding transformation string before being added to the
      #   URL. SDKs are updated regularly to support new transformations. If you want to
      #   use a transformation that is not supported by the SDK, You can use the `raw`
      #   parameter to pass the transformation string directly. See the
      #   [Transformations documentation](https://imagekit.io/docs/transformations).
      #
      #   @param ai_change_background [String] Uses AI to change the background. Provide a text prompt or a base64-encoded prom
      #
      #   @param ai_drop_shadow [Boolean, true, String] Adds an AI-based drop shadow around a foreground object on a transparent or remo
      #
      #   @param ai_edit [String] Uses AI to edit images based on a text prompt. Provide a text prompt or a base64
      #
      #   @param ai_remove_background [Boolean, Imagekitio::Models::Transformation::AIRemoveBackground] Applies ImageKit's in-house background removal.
      #
      #   @param ai_remove_background_external [Boolean, Imagekitio::Models::Transformation::AIRemoveBackgroundExternal] Uses third-party background removal.
      #
      #   @param ai_retouch [Boolean, Imagekitio::Models::Transformation::AIRetouch] Performs AI-based retouching to improve faces or product shots. Not supported in
      #
      #   @param ai_upscale [Boolean, Imagekitio::Models::Transformation::AIUpscale] Upscales images beyond their original dimensions using AI. Not supported inside
      #
      #   @param ai_variation [Boolean, Imagekitio::Models::Transformation::AIVariation] Generates a variation of an image using AI. This produces a new image with sligh
      #
      #   @param aspect_ratio [Float, String] Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with e
      #
      #   @param audio_codec [Symbol, Imagekitio::Models::Transformation::AudioCodec] Specifies the audio codec, e.g., `aac`, `opus`, or `none`. See [Audio codec](htt
      #
      #   @param background [String] Specifies the background to be used in conjunction with certain cropping strateg
      #
      #   @param blur [Float] Specifies the Gaussian blur level. Accepts an integer value between 1 and 100, o
      #
      #   @param border [String] Adds a border to the output media. Accepts a string in the format `<border-width
      #
      #   @param color_profile [Boolean] Indicates whether the output image should retain the original color profile.
      #
      #   @param contrast_stretch [Boolean, Imagekitio::Models::Transformation::ContrastStretch] Automatically enhances the contrast of an image (contrast stretch).
      #
      #   @param crop [Symbol, Imagekitio::Models::Transformation::Crop] Crop modes for image resizing. See [Crop modes & focus](https://imagekit.io/docs
      #
      #   @param crop_mode [Symbol, Imagekitio::Models::Transformation::CropMode] Additional crop modes for image resizing. See [Crop modes & focus](https://image
      #
      #   @param default_image [String] Specifies a fallback image if the resource is not found, e.g., a URL or file pat
      #
      #   @param dpr [Float] Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio (DP
      #
      #   @param duration [Float, String] Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #
      #   @param end_offset [Float, String] Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      #
      #   @param flip [Symbol, Imagekitio::Models::Transformation::Flip] Flips or mirrors an image either horizontally, vertically, or both.
      #
      #   @param focus [String] Refines padding and cropping behavior for pad resize, maintain ratio, and extrac
      #
      #   @param format_ [Symbol, Imagekitio::Models::Transformation::Format] Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`, `m
      #
      #   @param gradient [Boolean, true, String] Creates a linear gradient with two colors. Pass `true` for a default gradient, o
      #
      #   @param grayscale [Boolean, Imagekitio::Models::Transformation::Grayscale] Enables a grayscale effect for images. See [Grayscale](https://imagekit.io/docs/
      #
      #   @param height [Float, String] Specifies the height of the output. If a value between 0 and 1 is provided, it i
      #
      #   @param lossless [Boolean] Specifies whether the output image (in JPEG or PNG) should be compressed lossles
      #
      #   @param metadata [Boolean] By default, ImageKit removes all metadata during automatic image compression.
      #
      #   @param named [String] Named transformation reference. See [Named transformations](https://imagekit.io/
      #
      #   @param opacity [Float] Specifies the opacity level of the output image. See [Opacity](https://imagekit.
      #
      #   @param original [Boolean] If set to true, serves the original file without applying any transformations.
      #
      #   @param overlay [Imagekitio::Models::Overlay] Specifies an overlay to be applied on the parent image or video.
      #
      #   @param page [Float, String] Extracts a specific page or frame from multi-page or layered files (PDF, PSD, AI
      #
      #   @param progressive [Boolean] Specifies whether the output JPEG image should be rendered progressively. Progre
      #
      #   @param quality [Float] Specifies the quality of the output image for lossy formats such as JPEG, WebP,
      #
      #   @param radius [Float, Symbol, :max] Specifies the corner radius for rounded corners (e.g., 20) or `max` for circular
      #
      #   @param raw [String] Pass any transformation not directly supported by the SDK.
      #
      #   @param rotation [Float, String] Specifies the rotation angle in degrees. Positive values rotate the image clockw
      #
      #   @param shadow [Boolean, true, String] Adds a shadow beneath solid objects in an image with a transparent background.
      #
      #   @param sharpen [Boolean, true, Float] Sharpens the input image, highlighting edges and finer details.
      #
      #   @param start_offset [Float, String] Specifies the start offset (in seconds) for trimming videos, e.g., `5` or `10.5`
      #
      #   @param streaming_resolutions [Array<Symbol, Imagekitio::Models::StreamingResolution>] An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`, `48
      #
      #   @param trim [Boolean, true, Float] Useful for images with a solid or nearly solid background and a central object.
      #
      #   @param unsharp_mask [Boolean, true, String] Applies Unsharp Masking (USM), an image sharpening technique.
      #
      #   @param video_codec [Symbol, Imagekitio::Models::Transformation::VideoCodec] Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`. See [Video cod
      #
      #   @param width [Float, String] Specifies the width of the output. If a value between 0 and 1 is provided, it is
      #
      #   @param x [Float, String] Focus using cropped image coordinates - X coordinate. See [Focus using cropped c
      #
      #   @param x_center [Float, String] Focus using cropped image coordinates - X center coordinate. See [Focus using cr
      #
      #   @param y_ [Float, String] Focus using cropped image coordinates - Y coordinate. See [Focus using cropped c
      #
      #   @param y_center [Float, String] Focus using cropped image coordinates - Y center coordinate. See [Focus using cr
      #
      #   @param zoom [Float] Accepts a numeric value that determines how much to zoom in or out of the croppe

      # Adds an AI-based drop shadow around a foreground object on a transparent or
      # removed background. Optionally, control the direction, elevation, and saturation
      # of the light source (e.g., `az-45` to change light direction). Pass `true` for
      # the default drop shadow, or provide a string for a custom drop shadow. Supported
      # inside overlay. See
      # [AI Drop Shadow](https://imagekit.io/docs/ai-transformations#ai-drop-shadow-e-dropshadow).
      #
      # @see Imagekitio::Models::Transformation#ai_drop_shadow
      module AIDropShadow
        extend Imagekitio::Internal::Type::Union

        variant const: true

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, true, String)]
      end

      # Applies ImageKit's in-house background removal. Supported inside overlay. See
      # [AI Background Removal](https://imagekit.io/docs/ai-transformations#imagekit-background-removal-e-bgremove).
      #
      # @see Imagekitio::Models::Transformation#ai_remove_background
      module AIRemoveBackground
        extend Imagekitio::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Uses third-party background removal. Note: It is recommended to use
      # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      # Supported inside overlay. See
      # [External Background Removal](https://imagekit.io/docs/ai-transformations#background-removal-e-removedotbg).
      #
      # @see Imagekitio::Models::Transformation#ai_remove_background_external
      module AIRemoveBackgroundExternal
        extend Imagekitio::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Performs AI-based retouching to improve faces or product shots. Not supported
      # inside overlay. See
      # [AI Retouch](https://imagekit.io/docs/ai-transformations#retouch-e-retouch).
      #
      # @see Imagekitio::Models::Transformation#ai_retouch
      module AIRetouch
        extend Imagekitio::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Upscales images beyond their original dimensions using AI. Not supported inside
      # overlay. See
      # [AI Upscale](https://imagekit.io/docs/ai-transformations#upscale-e-upscale).
      #
      # @see Imagekitio::Models::Transformation#ai_upscale
      module AIUpscale
        extend Imagekitio::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Generates a variation of an image using AI. This produces a new image with
      # slight variations from the original, such as changes in color, texture, and
      # other visual elements, while preserving the structure and essence of the
      # original image. Not supported inside overlay. See
      # [AI Generate Variations](https://imagekit.io/docs/ai-transformations#generate-variations-of-an-image-e-genvar).
      #
      # @see Imagekitio::Models::Transformation#ai_variation
      module AIVariation
        extend Imagekitio::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      # or an expression like `iar_div_2`. See
      # [Image resize and crop – Aspect ratio](https://imagekit.io/docs/image-resize-and-crop#aspect-ratio---ar).
      #
      # @see Imagekitio::Models::Transformation#aspect_ratio
      module AspectRatio
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the audio codec, e.g., `aac`, `opus`, or `none`. See
      # [Audio codec](https://imagekit.io/docs/video-optimization#audio-codec---ac).
      #
      # @see Imagekitio::Models::Transformation#audio_codec
      module AudioCodec
        extend Imagekitio::Internal::Type::Enum

        AAC = :aac
        OPUS = :opus
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Automatically enhances the contrast of an image (contrast stretch). See
      # [Contrast Stretch](https://imagekit.io/docs/effects-and-enhancements#contrast-stretch---e-contrast).
      #
      # @see Imagekitio::Models::Transformation#contrast_stretch
      module ContrastStretch
        extend Imagekitio::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Crop modes for image resizing. See
      # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      #
      # @see Imagekitio::Models::Transformation#crop
      module Crop
        extend Imagekitio::Internal::Type::Enum

        FORCE = :force
        AT_MAX = :at_max
        AT_MAX_ENLARGE = :at_max_enlarge
        AT_LEAST = :at_least
        MAINTAIN_RATIO = :maintain_ratio

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Additional crop modes for image resizing. See
      # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      #
      # @see Imagekitio::Models::Transformation#crop_mode
      module CropMode
        extend Imagekitio::Internal::Type::Enum

        PAD_RESIZE = :pad_resize
        EXTRACT = :extract
        PAD_EXTRACT = :pad_extract

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to indicate the length from the start offset.
      # Arithmetic expressions are supported. See
      # [Trim videos – Duration](https://imagekit.io/docs/trim-videos#duration---du).
      #
      # @see Imagekitio::Models::Transformation#duration
      module Duration
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to define a time window. Arithmetic expressions
      # are supported. See
      # [Trim videos – End offset](https://imagekit.io/docs/trim-videos#end-offset---eo).
      #
      # @see Imagekitio::Models::Transformation#end_offset
      module EndOffset
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      # `v_h`. See [Flip](https://imagekit.io/docs/effects-and-enhancements#flip---fl).
      #
      # @see Imagekitio::Models::Transformation#flip
      module Flip
        extend Imagekitio::Internal::Type::Enum

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
      # format parameter. See
      # [Image format](https://imagekit.io/docs/image-optimization#format---f) and
      # [Video format](https://imagekit.io/docs/video-optimization#format---f).
      #
      # @see Imagekitio::Models::Transformation#format_
      module Format
        extend Imagekitio::Internal::Type::Enum

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
      # or provide a string for a custom gradient. See
      # [Gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      #
      # @see Imagekitio::Models::Transformation#gradient
      module Gradient
        extend Imagekitio::Internal::Type::Union

        variant const: true

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, true, String)]
      end

      # Enables a grayscale effect for images. See
      # [Grayscale](https://imagekit.io/docs/effects-and-enhancements#grayscale---e-grayscale).
      #
      # @see Imagekitio::Models::Transformation#grayscale
      module Grayscale
        extend Imagekitio::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Specifies the height of the output. If a value between 0 and 1 is provided, it
      # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`). Height
      # transformation –
      # [Images](https://imagekit.io/docs/image-resize-and-crop#height---h) ·
      # [Videos](https://imagekit.io/docs/video-resize-and-crop#height---h)
      #
      # @see Imagekitio::Models::Transformation#height
      module Height
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer). See
      # [Thumbnail extraction](https://imagekit.io/docs/vector-and-animated-images#get-thumbnail-from-psd-pdf-ai-eps-and-animated-files).
      #
      # @see Imagekitio::Models::Transformation#page
      module Page
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Specifies the corner radius for rounded corners (e.g., 20) or `max` for circular
      # or oval shape. See
      # [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      #
      # @see Imagekitio::Models::Transformation#radius
      module Radius
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant const: :max

        # @!method self.variants
        #   @return [Array(Float, Symbol, :max)]
      end

      # Specifies the rotation angle in degrees. Positive values rotate the image
      # clockwise; you can also use, for example, `N40` for counterclockwise rotation or
      # `auto` to use the orientation specified in the image's EXIF data. For videos,
      # only the following values are supported: 0, 90, 180, 270, or 360. See
      # [Rotate](https://imagekit.io/docs/effects-and-enhancements#rotate---rt).
      #
      # @see Imagekitio::Models::Transformation#rotation
      module Rotation
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Adds a shadow beneath solid objects in an image with a transparent background.
      # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      # shadow, or provide a string for a custom shadow. See
      # [Shadow](https://imagekit.io/docs/effects-and-enhancements#shadow---e-shadow).
      #
      # @see Imagekitio::Models::Transformation#shadow
      module Shadow
        extend Imagekitio::Internal::Type::Union

        variant const: true

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, true, String)]
      end

      # Sharpens the input image, highlighting edges and finer details. Pass `true` for
      # default sharpening, or provide a numeric value for custom sharpening. See
      # [Sharpen](https://imagekit.io/docs/effects-and-enhancements#sharpen---e-sharpen).
      #
      # @see Imagekitio::Models::Transformation#sharpen
      module Sharpen
        extend Imagekitio::Internal::Type::Union

        variant const: true

        variant Float

        # @!method self.variants
        #   @return [Array(Boolean, true, Float)]
      end

      # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      # `10.5`. Arithmetic expressions are also supported. See
      # [Trim videos – Start offset](https://imagekit.io/docs/trim-videos#start-offset---so).
      #
      # @see Imagekitio::Models::Transformation#start_offset
      module StartOffset
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Useful for images with a solid or nearly solid background and a central object.
      # This parameter trims the background, leaving only the central object in the
      # output image. See
      # [Trim edges](https://imagekit.io/docs/effects-and-enhancements#trim-edges---t).
      #
      # @see Imagekitio::Models::Transformation#trim
      module Trim
        extend Imagekitio::Internal::Type::Union

        variant const: true

        variant Float

        # @!method self.variants
        #   @return [Array(Boolean, true, Float)]
      end

      # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      # default unsharp mask, or provide a string for a custom unsharp mask. See
      # [Unsharp Mask](https://imagekit.io/docs/effects-and-enhancements#unsharp-mask---e-usm).
      #
      # @see Imagekitio::Models::Transformation#unsharp_mask
      module UnsharpMask
        extend Imagekitio::Internal::Type::Union

        variant const: true

        variant String

        # @!method self.variants
        #   @return [Array(Boolean, true, String)]
      end

      # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`. See
      # [Video codec](https://imagekit.io/docs/video-optimization#video-codec---vc).
      #
      # @see Imagekitio::Models::Transformation#video_codec
      module VideoCodec
        extend Imagekitio::Internal::Type::Enum

        H264 = :h264
        VP9 = :vp9
        AV1 = :av1
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Specifies the width of the output. If a value between 0 and 1 is provided, it is
      # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      # can also supply arithmetic expressions (e.g., `iw_div_2`). Width transformation
      # – [Images](https://imagekit.io/docs/image-resize-and-crop#width---w) ·
      # [Videos](https://imagekit.io/docs/video-resize-and-crop#width---w)
      #
      # @see Imagekitio::Models::Transformation#width
      module Width
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - X coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      # @see Imagekitio::Models::Transformation#x
      module X
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - X center coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      # @see Imagekitio::Models::Transformation#x_center
      module XCenter
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - Y coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      # @see Imagekitio::Models::Transformation#y_
      module Y
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end

      # Focus using cropped image coordinates - Y center coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      #
      # @see Imagekitio::Models::Transformation#y_center
      module YCenter
        extend Imagekitio::Internal::Type::Union

        variant Float

        variant String

        # @!method self.variants
        #   @return [Array(Float, String)]
      end
    end
  end
end
