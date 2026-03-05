# typed: strong

module Imagekitio
  module Models
    class Transformation < Imagekitio::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Imagekitio::Transformation, Imagekitio::Internal::AnyHash)
        end

      # Uses AI to change the background. Provide a text prompt or a base64-encoded
      # prompt, e.g., `prompt-snow road` or `prompte-[urlencoded_base64_encoded_text]`.
      # Not supported inside overlay. See
      # [AI Change Background](https://imagekit.io/docs/ai-transformations#change-background-e-changebg).
      sig { returns(T.nilable(String)) }
      attr_reader :ai_change_background

      sig { params(ai_change_background: String).void }
      attr_writer :ai_change_background

      # Adds an AI-based drop shadow around a foreground object on a transparent or
      # removed background. Optionally, control the direction, elevation, and saturation
      # of the light source (e.g., `az-45` to change light direction). Pass `true` for
      # the default drop shadow, or provide a string for a custom drop shadow. Supported
      # inside overlay. See
      # [AI Drop Shadow](https://imagekit.io/docs/ai-transformations#ai-drop-shadow-e-dropshadow).
      sig { returns(T.nilable(T.any(T::Boolean, String))) }
      attr_reader :ai_drop_shadow

      sig { params(ai_drop_shadow: T.any(T::Boolean, String)).void }
      attr_writer :ai_drop_shadow

      # Uses AI to edit images based on a text prompt. Provide a text prompt or a
      # base64-encoded prompt, e.g., `prompt-snow road` or
      # `prompte-[urlencoded_base64_encoded_text]`. Not supported inside overlay.
      # See [AI Edit](https://imagekit.io/docs/ai-transformations#edit-image-e-edit).
      sig { returns(T.nilable(String)) }
      attr_reader :ai_edit

      sig { params(ai_edit: String).void }
      attr_writer :ai_edit

      # Applies ImageKit's in-house background removal. Supported inside overlay. See
      # [AI Background Removal](https://imagekit.io/docs/ai-transformations#imagekit-background-removal-e-bgremove).
      sig do
        returns(
          T.nilable(Imagekitio::Transformation::AIRemoveBackground::OrBoolean)
        )
      end
      attr_reader :ai_remove_background

      sig do
        params(
          ai_remove_background:
            Imagekitio::Transformation::AIRemoveBackground::OrBoolean
        ).void
      end
      attr_writer :ai_remove_background

      # Uses third-party background removal. Note: It is recommended to use
      # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      # Supported inside overlay. See
      # [External Background Removal](https://imagekit.io/docs/ai-transformations#background-removal-e-removedotbg).
      sig do
        returns(
          T.nilable(
            Imagekitio::Transformation::AIRemoveBackgroundExternal::OrBoolean
          )
        )
      end
      attr_reader :ai_remove_background_external

      sig do
        params(
          ai_remove_background_external:
            Imagekitio::Transformation::AIRemoveBackgroundExternal::OrBoolean
        ).void
      end
      attr_writer :ai_remove_background_external

      # Performs AI-based retouching to improve faces or product shots. Not supported
      # inside overlay. See
      # [AI Retouch](https://imagekit.io/docs/ai-transformations#retouch-e-retouch).
      sig do
        returns(T.nilable(Imagekitio::Transformation::AIRetouch::OrBoolean))
      end
      attr_reader :ai_retouch

      sig do
        params(
          ai_retouch: Imagekitio::Transformation::AIRetouch::OrBoolean
        ).void
      end
      attr_writer :ai_retouch

      # Upscales images beyond their original dimensions using AI. Not supported inside
      # overlay. See
      # [AI Upscale](https://imagekit.io/docs/ai-transformations#upscale-e-upscale).
      sig do
        returns(T.nilable(Imagekitio::Transformation::AIUpscale::OrBoolean))
      end
      attr_reader :ai_upscale

      sig do
        params(
          ai_upscale: Imagekitio::Transformation::AIUpscale::OrBoolean
        ).void
      end
      attr_writer :ai_upscale

      # Generates a variation of an image using AI. This produces a new image with
      # slight variations from the original, such as changes in color, texture, and
      # other visual elements, while preserving the structure and essence of the
      # original image. Not supported inside overlay. See
      # [AI Generate Variations](https://imagekit.io/docs/ai-transformations#generate-variations-of-an-image-e-genvar).
      sig do
        returns(T.nilable(Imagekitio::Transformation::AIVariation::OrBoolean))
      end
      attr_reader :ai_variation

      sig do
        params(
          ai_variation: Imagekitio::Transformation::AIVariation::OrBoolean
        ).void
      end
      attr_writer :ai_variation

      # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      # or an expression like `iar_div_2`. See
      # [Image resize and crop – Aspect ratio](https://imagekit.io/docs/image-resize-and-crop#aspect-ratio---ar).
      sig do
        returns(T.nilable(Imagekitio::Transformation::AspectRatio::Variants))
      end
      attr_reader :aspect_ratio

      sig do
        params(
          aspect_ratio: Imagekitio::Transformation::AspectRatio::Variants
        ).void
      end
      attr_writer :aspect_ratio

      # Specifies the audio codec, e.g., `aac`, `opus`, or `none`. See
      # [Audio codec](https://imagekit.io/docs/video-optimization#audio-codec---ac).
      sig do
        returns(T.nilable(Imagekitio::Transformation::AudioCodec::OrSymbol))
      end
      attr_reader :audio_codec

      sig do
        params(
          audio_codec: Imagekitio::Transformation::AudioCodec::OrSymbol
        ).void
      end
      attr_writer :audio_codec

      # Specifies the background to be used in conjunction with certain cropping
      # strategies when resizing an image.
      #
      # - A solid color: e.g., `red`, `F3F3F3`, `AAFF0010`. See
      #   [Solid color background](https://imagekit.io/docs/effects-and-enhancements#solid-color-background).
      # - Dominant color: `dominant` extracts the dominant color from the image. See
      #   [Dominant color background](https://imagekit.io/docs/effects-and-enhancements#dominant-color-background).
      # - Gradient: `gradient_dominant` or `gradient_dominant_2` creates a gradient
      #   using the dominant colors. Optionally specify palette size (2 or 4), e.g.,
      #   `gradient_dominant_4`. See
      #   [Gradient background](https://imagekit.io/docs/effects-and-enhancements#gradient-background).
      # - A blurred background: e.g., `blurred`, `blurred_25_N15`, etc. See
      #   [Blurred background](https://imagekit.io/docs/effects-and-enhancements#blurred-background).
      # - Expand the image boundaries using generative fill: `genfill`. Not supported
      #   inside overlay. Optionally, control the background scene by passing a text
      #   prompt: `genfill[:-prompt-${text}]` or
      #   `genfill[:-prompte-${urlencoded_base64_encoded_text}]`. See
      #   [Generative fill background](https://imagekit.io/docs/ai-transformations#generative-fill-bg-genfill).
      sig { returns(T.nilable(String)) }
      attr_reader :background

      sig { params(background: String).void }
      attr_writer :background

      # Specifies the Gaussian blur level. Accepts an integer value between 1 and 100,
      # or an expression like `bl-10`. See
      # [Blur](https://imagekit.io/docs/effects-and-enhancements#blur---bl).
      sig { returns(T.nilable(Float)) }
      attr_reader :blur

      sig { params(blur: Float).void }
      attr_writer :blur

      # Adds a border to the output media. Accepts a string in the format
      # `<border-width>_<hex-code>` (e.g., `5_FFF000` for a 5px yellow border), or an
      # expression like `ih_div_20_FF00FF`. See
      # [Border](https://imagekit.io/docs/effects-and-enhancements#border---b).
      sig { returns(T.nilable(String)) }
      attr_reader :border

      sig { params(border: String).void }
      attr_writer :border

      # Indicates whether the output image should retain the original color profile. See
      # [Color profile](https://imagekit.io/docs/image-optimization#color-profile---cp).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :color_profile

      sig { params(color_profile: T::Boolean).void }
      attr_writer :color_profile

      # Replaces colors in the image. Supports three formats:
      #
      # - `toColor` - Replace dominant color with the specified color.
      # - `toColor_tolerance` - Replace dominant color with specified tolerance (0-100).
      # - `toColor_tolerance_fromColor` - Replace a specific color with another within
      #   tolerance range. Colors can be hex codes (e.g., `FF0022`) or names (e.g.,
      #   `red`, `blue`). See
      #   [Color replacement](https://imagekit.io/docs/effects-and-enhancements#color-replace---cr).
      sig { returns(T.nilable(String)) }
      attr_reader :color_replace

      sig { params(color_replace: String).void }
      attr_writer :color_replace

      # Automatically enhances the contrast of an image (contrast stretch). See
      # [Contrast Stretch](https://imagekit.io/docs/effects-and-enhancements#contrast-stretch---e-contrast).
      sig do
        returns(
          T.nilable(Imagekitio::Transformation::ContrastStretch::OrBoolean)
        )
      end
      attr_reader :contrast_stretch

      sig do
        params(
          contrast_stretch:
            Imagekitio::Transformation::ContrastStretch::OrBoolean
        ).void
      end
      attr_writer :contrast_stretch

      # Crop modes for image resizing. See
      # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      sig { returns(T.nilable(Imagekitio::Transformation::Crop::OrSymbol)) }
      attr_reader :crop

      sig { params(crop: Imagekitio::Transformation::Crop::OrSymbol).void }
      attr_writer :crop

      # Additional crop modes for image resizing. See
      # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      sig { returns(T.nilable(Imagekitio::Transformation::CropMode::OrSymbol)) }
      attr_reader :crop_mode

      sig do
        params(crop_mode: Imagekitio::Transformation::CropMode::OrSymbol).void
      end
      attr_writer :crop_mode

      # Specifies a fallback image if the resource is not found, e.g., a URL or file
      # path. See
      # [Default image](https://imagekit.io/docs/image-transformation#default-image---di).
      sig { returns(T.nilable(String)) }
      attr_reader :default_image

      sig { params(default_image: String).void }
      attr_writer :default_image

      # Distorts the shape of an image. Supports two modes:
      #
      # - Perspective distortion: `p-x1_y1_x2_y2_x3_y3_x4_y4` changes the position of
      #   the four corners starting clockwise from top-left.
      # - Arc distortion: `a-degrees` curves the image upwards (positive values) or
      #   downwards (negative values). See
      #   [Distort effect](https://imagekit.io/docs/effects-and-enhancements#distort---e-distort).
      sig { returns(T.nilable(String)) }
      attr_reader :distort

      sig { params(distort: String).void }
      attr_writer :distort

      # Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio
      # (DPR) calculation. Also accepts arithmetic expressions.
      #
      # - Learn about
      #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
      # - See [DPR](https://imagekit.io/docs/image-resize-and-crop#dpr---dpr).
      sig { returns(T.nilable(Float)) }
      attr_reader :dpr

      sig { params(dpr: Float).void }
      attr_writer :dpr

      # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to indicate the length from the start offset.
      # Arithmetic expressions are supported. See
      # [Trim videos – Duration](https://imagekit.io/docs/trim-videos#duration---du).
      sig { returns(T.nilable(Imagekitio::Transformation::Duration::Variants)) }
      attr_reader :duration

      sig do
        params(duration: Imagekitio::Transformation::Duration::Variants).void
      end
      attr_writer :duration

      # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to define a time window. Arithmetic expressions
      # are supported. See
      # [Trim videos – End offset](https://imagekit.io/docs/trim-videos#end-offset---eo).
      sig do
        returns(T.nilable(Imagekitio::Transformation::EndOffset::Variants))
      end
      attr_reader :end_offset

      sig do
        params(end_offset: Imagekitio::Transformation::EndOffset::Variants).void
      end
      attr_writer :end_offset

      # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      # `v_h`. See [Flip](https://imagekit.io/docs/effects-and-enhancements#flip---fl).
      sig { returns(T.nilable(Imagekitio::Transformation::Flip::OrSymbol)) }
      attr_reader :flip

      sig { params(flip: Imagekitio::Transformation::Flip::OrSymbol).void }
      attr_writer :flip

      # Refines padding and cropping behavior for pad resize, maintain ratio, and
      # extract crop modes. Supports manual positions and coordinate-based focus. With
      # AI-based cropping, you can automatically keep key subjects in frame—such as
      # faces or detected objects (e.g., `fo-face`, `fo-person`, `fo-car`)— while
      # resizing.
      #
      # - See [Focus](https://imagekit.io/docs/image-resize-and-crop#focus---fo).
      # - [Object aware cropping](https://imagekit.io/docs/image-resize-and-crop#object-aware-cropping---fo-object-name)
      sig { returns(T.nilable(String)) }
      attr_reader :focus

      sig { params(focus: String).void }
      attr_writer :focus

      # Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
      # `mp4`, or `auto`. You can also pass `orig` for images to return the original
      # format. ImageKit automatically delivers images and videos in the optimal format
      # based on device support unless overridden by the dashboard settings or the
      # format parameter. See
      # [Image format](https://imagekit.io/docs/image-optimization#format---f) and
      # [Video format](https://imagekit.io/docs/video-optimization#format---f).
      sig { returns(T.nilable(Imagekitio::Transformation::Format::OrSymbol)) }
      attr_reader :format_

      sig { params(format_: Imagekitio::Transformation::Format::OrSymbol).void }
      attr_writer :format_

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient. See
      # [Gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      sig { returns(T.nilable(T.any(T::Boolean, String))) }
      attr_reader :gradient

      sig { params(gradient: T.any(T::Boolean, String)).void }
      attr_writer :gradient

      # Enables a grayscale effect for images. See
      # [Grayscale](https://imagekit.io/docs/effects-and-enhancements#grayscale---e-grayscale).
      sig do
        returns(T.nilable(Imagekitio::Transformation::Grayscale::OrBoolean))
      end
      attr_reader :grayscale

      sig do
        params(grayscale: Imagekitio::Transformation::Grayscale::OrBoolean).void
      end
      attr_writer :grayscale

      # Specifies the height of the output. If a value between 0 and 1 is provided, it
      # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`). Height
      # transformation –
      # [Images](https://imagekit.io/docs/image-resize-and-crop#height---h) ·
      # [Videos](https://imagekit.io/docs/video-resize-and-crop#height---h)
      sig { returns(T.nilable(Imagekitio::Transformation::Height::Variants)) }
      attr_reader :height

      sig { params(height: Imagekitio::Transformation::Height::Variants).void }
      attr_writer :height

      # Specifies whether the output image (in JPEG or PNG) should be compressed
      # losslessly. See
      # [Lossless compression](https://imagekit.io/docs/image-optimization#lossless-webp-and-png---lo).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :lossless

      sig { params(lossless: T::Boolean).void }
      attr_writer :lossless

      # By default, ImageKit removes all metadata during automatic image compression.
      # Set this to true to preserve metadata. See
      # [Image metadata](https://imagekit.io/docs/image-optimization#image-metadata---md).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :metadata

      sig { params(metadata: T::Boolean).void }
      attr_writer :metadata

      # Named transformation reference. See
      # [Named transformations](https://imagekit.io/docs/transformations#named-transformations).
      sig { returns(T.nilable(String)) }
      attr_reader :named

      sig { params(named: String).void }
      attr_writer :named

      # Specifies the opacity level of the output image. See
      # [Opacity](https://imagekit.io/docs/effects-and-enhancements#opacity---o).
      sig { returns(T.nilable(Float)) }
      attr_reader :opacity

      sig { params(opacity: Float).void }
      attr_writer :opacity

      # If set to true, serves the original file without applying any transformations.
      # See
      # [Deliver original file as-is](https://imagekit.io/docs/core-delivery-features#deliver-original-file-as-is---orig-true).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :original

      sig { params(original: T::Boolean).void }
      attr_writer :original

      # Specifies an overlay to be applied on the parent image or video. ImageKit
      # supports overlays including images, text, videos, subtitles, and solid colors.
      # See
      # [Overlay using layers](https://imagekit.io/docs/transformations#overlay-using-layers).
      sig { returns(T.nilable(Imagekitio::Overlay)) }
      attr_reader :overlay

      sig { params(overlay: Imagekitio::Overlay).void }
      attr_writer :overlay

      # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer). See
      # [Thumbnail extraction](https://imagekit.io/docs/vector-and-animated-images#get-thumbnail-from-psd-pdf-ai-eps-and-animated-files).
      sig { returns(T.nilable(Imagekitio::Transformation::Page::Variants)) }
      attr_reader :page

      sig { params(page: Imagekitio::Transformation::Page::Variants).void }
      attr_writer :page

      # Specifies whether the output JPEG image should be rendered progressively.
      # Progressive loading begins with a low-quality, pixelated version of the full
      # image, which gradually improves to provide a faster perceived load time. See
      # [Progressive images](https://imagekit.io/docs/image-optimization#progressive-image---pr).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :progressive

      sig { params(progressive: T::Boolean).void }
      attr_writer :progressive

      # Specifies the quality of the output image for lossy formats such as JPEG, WebP,
      # and AVIF. A higher quality value results in a larger file size with better
      # quality, while a lower value produces a smaller file size with reduced quality.
      # See [Quality](https://imagekit.io/docs/image-optimization#quality---q).
      sig { returns(T.nilable(Float)) }
      attr_reader :quality

      sig { params(quality: Float).void }
      attr_writer :quality

      # Specifies the corner radius for rounded corners.
      #
      # - Single value (positive integer): Applied to all corners (e.g., `20`).
      # - `max`: Creates a circular or oval shape.
      # - Per-corner array: Provide four underscore-separated values representing
      #   top-left, top-right, bottom-right, and bottom-left corners respectively (e.g.,
      #   `10_20_30_40`). See
      #   [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      sig { returns(T.nilable(T.any(Float, Symbol, String))) }
      attr_reader :radius

      sig { params(radius: T.any(Float, Symbol, String)).void }
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
      # only the following values are supported: 0, 90, 180, 270, or 360. See
      # [Rotate](https://imagekit.io/docs/effects-and-enhancements#rotate---rt).
      sig { returns(T.nilable(Imagekitio::Transformation::Rotation::Variants)) }
      attr_reader :rotation

      sig do
        params(rotation: Imagekitio::Transformation::Rotation::Variants).void
      end
      attr_writer :rotation

      # Adds a shadow beneath solid objects in an image with a transparent background.
      # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      # shadow, or provide a string for a custom shadow. See
      # [Shadow](https://imagekit.io/docs/effects-and-enhancements#shadow---e-shadow).
      sig { returns(T.nilable(T.any(T::Boolean, String))) }
      attr_reader :shadow

      sig { params(shadow: T.any(T::Boolean, String)).void }
      attr_writer :shadow

      # Sharpens the input image, highlighting edges and finer details. Pass `true` for
      # default sharpening, or provide a numeric value for custom sharpening. See
      # [Sharpen](https://imagekit.io/docs/effects-and-enhancements#sharpen---e-sharpen).
      sig { returns(T.nilable(T.any(T::Boolean, Float))) }
      attr_reader :sharpen

      sig { params(sharpen: T.any(T::Boolean, Float)).void }
      attr_writer :sharpen

      # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      # `10.5`. Arithmetic expressions are also supported. See
      # [Trim videos – Start offset](https://imagekit.io/docs/trim-videos#start-offset---so).
      sig do
        returns(T.nilable(Imagekitio::Transformation::StartOffset::Variants))
      end
      attr_reader :start_offset

      sig do
        params(
          start_offset: Imagekitio::Transformation::StartOffset::Variants
        ).void
      end
      attr_writer :start_offset

      # An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`,
      # `480`, `720`, `1080`]. See
      # [Adaptive Bitrate Streaming](https://imagekit.io/docs/adaptive-bitrate-streaming).
      sig do
        returns(T.nilable(T::Array[Imagekitio::StreamingResolution::OrSymbol]))
      end
      attr_reader :streaming_resolutions

      sig do
        params(
          streaming_resolutions:
            T::Array[Imagekitio::StreamingResolution::OrSymbol]
        ).void
      end
      attr_writer :streaming_resolutions

      # Useful for images with a solid or nearly solid background and a central object.
      # This parameter trims the background, leaving only the central object in the
      # output image. See
      # [Trim edges](https://imagekit.io/docs/effects-and-enhancements#trim-edges---t).
      sig { returns(T.nilable(T.any(T::Boolean, Float))) }
      attr_reader :trim

      sig { params(trim: T.any(T::Boolean, Float)).void }
      attr_writer :trim

      # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      # default unsharp mask, or provide a string for a custom unsharp mask. See
      # [Unsharp Mask](https://imagekit.io/docs/effects-and-enhancements#unsharp-mask---e-usm).
      sig { returns(T.nilable(T.any(T::Boolean, String))) }
      attr_reader :unsharp_mask

      sig { params(unsharp_mask: T.any(T::Boolean, String)).void }
      attr_writer :unsharp_mask

      # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`. See
      # [Video codec](https://imagekit.io/docs/video-optimization#video-codec---vc).
      sig do
        returns(T.nilable(Imagekitio::Transformation::VideoCodec::OrSymbol))
      end
      attr_reader :video_codec

      sig do
        params(
          video_codec: Imagekitio::Transformation::VideoCodec::OrSymbol
        ).void
      end
      attr_writer :video_codec

      # Specifies the width of the output. If a value between 0 and 1 is provided, it is
      # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      # can also supply arithmetic expressions (e.g., `iw_div_2`). Width transformation
      # – [Images](https://imagekit.io/docs/image-resize-and-crop#width---w) ·
      # [Videos](https://imagekit.io/docs/video-resize-and-crop#width---w)
      sig { returns(T.nilable(Imagekitio::Transformation::Width::Variants)) }
      attr_reader :width

      sig { params(width: Imagekitio::Transformation::Width::Variants).void }
      attr_writer :width

      # Focus using cropped image coordinates - X coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      sig { returns(T.nilable(Imagekitio::Transformation::X::Variants)) }
      attr_reader :x

      sig { params(x: Imagekitio::Transformation::X::Variants).void }
      attr_writer :x

      # Focus using cropped image coordinates - X center coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      sig { returns(T.nilable(Imagekitio::Transformation::XCenter::Variants)) }
      attr_reader :x_center

      sig do
        params(x_center: Imagekitio::Transformation::XCenter::Variants).void
      end
      attr_writer :x_center

      # Focus using cropped image coordinates - Y coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      sig { returns(T.nilable(Imagekitio::Transformation::Y::Variants)) }
      attr_reader :y_

      sig { params(y_: Imagekitio::Transformation::Y::Variants).void }
      attr_writer :y_

      # Focus using cropped image coordinates - Y center coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      sig { returns(T.nilable(Imagekitio::Transformation::YCenter::Variants)) }
      attr_reader :y_center

      sig do
        params(y_center: Imagekitio::Transformation::YCenter::Variants).void
      end
      attr_writer :y_center

      # Accepts a numeric value that determines how much to zoom in or out of the
      # cropped area. It should be used in conjunction with fo-face or fo-<object_name>.
      # See [Zoom](https://imagekit.io/docs/image-resize-and-crop#zoom---z).
      sig { returns(T.nilable(Float)) }
      attr_reader :zoom

      sig { params(zoom: Float).void }
      attr_writer :zoom

      # The SDK provides easy-to-use names for transformations. These names are
      # converted to the corresponding transformation string before being added to the
      # URL. SDKs are updated regularly to support new transformations. If you want to
      # use a transformation that is not supported by the SDK, You can use the `raw`
      # parameter to pass the transformation string directly. See the
      # [Transformations documentation](https://imagekit.io/docs/transformations).
      sig do
        params(
          ai_change_background: String,
          ai_drop_shadow: T.any(T::Boolean, String),
          ai_edit: String,
          ai_remove_background:
            Imagekitio::Transformation::AIRemoveBackground::OrBoolean,
          ai_remove_background_external:
            Imagekitio::Transformation::AIRemoveBackgroundExternal::OrBoolean,
          ai_retouch: Imagekitio::Transformation::AIRetouch::OrBoolean,
          ai_upscale: Imagekitio::Transformation::AIUpscale::OrBoolean,
          ai_variation: Imagekitio::Transformation::AIVariation::OrBoolean,
          aspect_ratio: Imagekitio::Transformation::AspectRatio::Variants,
          audio_codec: Imagekitio::Transformation::AudioCodec::OrSymbol,
          background: String,
          blur: Float,
          border: String,
          color_profile: T::Boolean,
          color_replace: String,
          contrast_stretch:
            Imagekitio::Transformation::ContrastStretch::OrBoolean,
          crop: Imagekitio::Transformation::Crop::OrSymbol,
          crop_mode: Imagekitio::Transformation::CropMode::OrSymbol,
          default_image: String,
          distort: String,
          dpr: Float,
          duration: Imagekitio::Transformation::Duration::Variants,
          end_offset: Imagekitio::Transformation::EndOffset::Variants,
          flip: Imagekitio::Transformation::Flip::OrSymbol,
          focus: String,
          format_: Imagekitio::Transformation::Format::OrSymbol,
          gradient: T.any(T::Boolean, String),
          grayscale: Imagekitio::Transformation::Grayscale::OrBoolean,
          height: Imagekitio::Transformation::Height::Variants,
          lossless: T::Boolean,
          metadata: T::Boolean,
          named: String,
          opacity: Float,
          original: T::Boolean,
          overlay: Imagekitio::Overlay,
          page: Imagekitio::Transformation::Page::Variants,
          progressive: T::Boolean,
          quality: Float,
          radius: T.any(Float, Symbol, String),
          raw: String,
          rotation: Imagekitio::Transformation::Rotation::Variants,
          shadow: T.any(T::Boolean, String),
          sharpen: T.any(T::Boolean, Float),
          start_offset: Imagekitio::Transformation::StartOffset::Variants,
          streaming_resolutions:
            T::Array[Imagekitio::StreamingResolution::OrSymbol],
          trim: T.any(T::Boolean, Float),
          unsharp_mask: T.any(T::Boolean, String),
          video_codec: Imagekitio::Transformation::VideoCodec::OrSymbol,
          width: Imagekitio::Transformation::Width::Variants,
          x: Imagekitio::Transformation::X::Variants,
          x_center: Imagekitio::Transformation::XCenter::Variants,
          y_: Imagekitio::Transformation::Y::Variants,
          y_center: Imagekitio::Transformation::YCenter::Variants,
          zoom: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # Uses AI to change the background. Provide a text prompt or a base64-encoded
        # prompt, e.g., `prompt-snow road` or `prompte-[urlencoded_base64_encoded_text]`.
        # Not supported inside overlay. See
        # [AI Change Background](https://imagekit.io/docs/ai-transformations#change-background-e-changebg).
        ai_change_background: nil,
        # Adds an AI-based drop shadow around a foreground object on a transparent or
        # removed background. Optionally, control the direction, elevation, and saturation
        # of the light source (e.g., `az-45` to change light direction). Pass `true` for
        # the default drop shadow, or provide a string for a custom drop shadow. Supported
        # inside overlay. See
        # [AI Drop Shadow](https://imagekit.io/docs/ai-transformations#ai-drop-shadow-e-dropshadow).
        ai_drop_shadow: nil,
        # Uses AI to edit images based on a text prompt. Provide a text prompt or a
        # base64-encoded prompt, e.g., `prompt-snow road` or
        # `prompte-[urlencoded_base64_encoded_text]`. Not supported inside overlay.
        # See [AI Edit](https://imagekit.io/docs/ai-transformations#edit-image-e-edit).
        ai_edit: nil,
        # Applies ImageKit's in-house background removal. Supported inside overlay. See
        # [AI Background Removal](https://imagekit.io/docs/ai-transformations#imagekit-background-removal-e-bgremove).
        ai_remove_background: nil,
        # Uses third-party background removal. Note: It is recommended to use
        # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
        # Supported inside overlay. See
        # [External Background Removal](https://imagekit.io/docs/ai-transformations#background-removal-e-removedotbg).
        ai_remove_background_external: nil,
        # Performs AI-based retouching to improve faces or product shots. Not supported
        # inside overlay. See
        # [AI Retouch](https://imagekit.io/docs/ai-transformations#retouch-e-retouch).
        ai_retouch: nil,
        # Upscales images beyond their original dimensions using AI. Not supported inside
        # overlay. See
        # [AI Upscale](https://imagekit.io/docs/ai-transformations#upscale-e-upscale).
        ai_upscale: nil,
        # Generates a variation of an image using AI. This produces a new image with
        # slight variations from the original, such as changes in color, texture, and
        # other visual elements, while preserving the structure and essence of the
        # original image. Not supported inside overlay. See
        # [AI Generate Variations](https://imagekit.io/docs/ai-transformations#generate-variations-of-an-image-e-genvar).
        ai_variation: nil,
        # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
        # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
        # or an expression like `iar_div_2`. See
        # [Image resize and crop – Aspect ratio](https://imagekit.io/docs/image-resize-and-crop#aspect-ratio---ar).
        aspect_ratio: nil,
        # Specifies the audio codec, e.g., `aac`, `opus`, or `none`. See
        # [Audio codec](https://imagekit.io/docs/video-optimization#audio-codec---ac).
        audio_codec: nil,
        # Specifies the background to be used in conjunction with certain cropping
        # strategies when resizing an image.
        #
        # - A solid color: e.g., `red`, `F3F3F3`, `AAFF0010`. See
        #   [Solid color background](https://imagekit.io/docs/effects-and-enhancements#solid-color-background).
        # - Dominant color: `dominant` extracts the dominant color from the image. See
        #   [Dominant color background](https://imagekit.io/docs/effects-and-enhancements#dominant-color-background).
        # - Gradient: `gradient_dominant` or `gradient_dominant_2` creates a gradient
        #   using the dominant colors. Optionally specify palette size (2 or 4), e.g.,
        #   `gradient_dominant_4`. See
        #   [Gradient background](https://imagekit.io/docs/effects-and-enhancements#gradient-background).
        # - A blurred background: e.g., `blurred`, `blurred_25_N15`, etc. See
        #   [Blurred background](https://imagekit.io/docs/effects-and-enhancements#blurred-background).
        # - Expand the image boundaries using generative fill: `genfill`. Not supported
        #   inside overlay. Optionally, control the background scene by passing a text
        #   prompt: `genfill[:-prompt-${text}]` or
        #   `genfill[:-prompte-${urlencoded_base64_encoded_text}]`. See
        #   [Generative fill background](https://imagekit.io/docs/ai-transformations#generative-fill-bg-genfill).
        background: nil,
        # Specifies the Gaussian blur level. Accepts an integer value between 1 and 100,
        # or an expression like `bl-10`. See
        # [Blur](https://imagekit.io/docs/effects-and-enhancements#blur---bl).
        blur: nil,
        # Adds a border to the output media. Accepts a string in the format
        # `<border-width>_<hex-code>` (e.g., `5_FFF000` for a 5px yellow border), or an
        # expression like `ih_div_20_FF00FF`. See
        # [Border](https://imagekit.io/docs/effects-and-enhancements#border---b).
        border: nil,
        # Indicates whether the output image should retain the original color profile. See
        # [Color profile](https://imagekit.io/docs/image-optimization#color-profile---cp).
        color_profile: nil,
        # Replaces colors in the image. Supports three formats:
        #
        # - `toColor` - Replace dominant color with the specified color.
        # - `toColor_tolerance` - Replace dominant color with specified tolerance (0-100).
        # - `toColor_tolerance_fromColor` - Replace a specific color with another within
        #   tolerance range. Colors can be hex codes (e.g., `FF0022`) or names (e.g.,
        #   `red`, `blue`). See
        #   [Color replacement](https://imagekit.io/docs/effects-and-enhancements#color-replace---cr).
        color_replace: nil,
        # Automatically enhances the contrast of an image (contrast stretch). See
        # [Contrast Stretch](https://imagekit.io/docs/effects-and-enhancements#contrast-stretch---e-contrast).
        contrast_stretch: nil,
        # Crop modes for image resizing. See
        # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
        crop: nil,
        # Additional crop modes for image resizing. See
        # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
        crop_mode: nil,
        # Specifies a fallback image if the resource is not found, e.g., a URL or file
        # path. See
        # [Default image](https://imagekit.io/docs/image-transformation#default-image---di).
        default_image: nil,
        # Distorts the shape of an image. Supports two modes:
        #
        # - Perspective distortion: `p-x1_y1_x2_y2_x3_y3_x4_y4` changes the position of
        #   the four corners starting clockwise from top-left.
        # - Arc distortion: `a-degrees` curves the image upwards (positive values) or
        #   downwards (negative values). See
        #   [Distort effect](https://imagekit.io/docs/effects-and-enhancements#distort---e-distort).
        distort: nil,
        # Accepts values between 0.1 and 5, or `auto` for automatic device pixel ratio
        # (DPR) calculation. Also accepts arithmetic expressions.
        #
        # - Learn about
        #   [Arithmetic expressions](https://imagekit.io/docs/arithmetic-expressions-in-transformations).
        # - See [DPR](https://imagekit.io/docs/image-resize-and-crop#dpr---dpr).
        dpr: nil,
        # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
        # Typically used with startOffset to indicate the length from the start offset.
        # Arithmetic expressions are supported. See
        # [Trim videos – Duration](https://imagekit.io/docs/trim-videos#duration---du).
        duration: nil,
        # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
        # Typically used with startOffset to define a time window. Arithmetic expressions
        # are supported. See
        # [Trim videos – End offset](https://imagekit.io/docs/trim-videos#end-offset---eo).
        end_offset: nil,
        # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
        # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
        # `v_h`. See [Flip](https://imagekit.io/docs/effects-and-enhancements#flip---fl).
        flip: nil,
        # Refines padding and cropping behavior for pad resize, maintain ratio, and
        # extract crop modes. Supports manual positions and coordinate-based focus. With
        # AI-based cropping, you can automatically keep key subjects in frame—such as
        # faces or detected objects (e.g., `fo-face`, `fo-person`, `fo-car`)— while
        # resizing.
        #
        # - See [Focus](https://imagekit.io/docs/image-resize-and-crop#focus---fo).
        # - [Object aware cropping](https://imagekit.io/docs/image-resize-and-crop#object-aware-cropping---fo-object-name)
        focus: nil,
        # Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
        # `mp4`, or `auto`. You can also pass `orig` for images to return the original
        # format. ImageKit automatically delivers images and videos in the optimal format
        # based on device support unless overridden by the dashboard settings or the
        # format parameter. See
        # [Image format](https://imagekit.io/docs/image-optimization#format---f) and
        # [Video format](https://imagekit.io/docs/video-optimization#format---f).
        format_: nil,
        # Creates a linear gradient with two colors. Pass `true` for a default gradient,
        # or provide a string for a custom gradient. See
        # [Gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
        gradient: nil,
        # Enables a grayscale effect for images. See
        # [Grayscale](https://imagekit.io/docs/effects-and-enhancements#grayscale---e-grayscale).
        grayscale: nil,
        # Specifies the height of the output. If a value between 0 and 1 is provided, it
        # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
        # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`). Height
        # transformation –
        # [Images](https://imagekit.io/docs/image-resize-and-crop#height---h) ·
        # [Videos](https://imagekit.io/docs/video-resize-and-crop#height---h)
        height: nil,
        # Specifies whether the output image (in JPEG or PNG) should be compressed
        # losslessly. See
        # [Lossless compression](https://imagekit.io/docs/image-optimization#lossless-webp-and-png---lo).
        lossless: nil,
        # By default, ImageKit removes all metadata during automatic image compression.
        # Set this to true to preserve metadata. See
        # [Image metadata](https://imagekit.io/docs/image-optimization#image-metadata---md).
        metadata: nil,
        # Named transformation reference. See
        # [Named transformations](https://imagekit.io/docs/transformations#named-transformations).
        named: nil,
        # Specifies the opacity level of the output image. See
        # [Opacity](https://imagekit.io/docs/effects-and-enhancements#opacity---o).
        opacity: nil,
        # If set to true, serves the original file without applying any transformations.
        # See
        # [Deliver original file as-is](https://imagekit.io/docs/core-delivery-features#deliver-original-file-as-is---orig-true).
        original: nil,
        # Specifies an overlay to be applied on the parent image or video. ImageKit
        # supports overlays including images, text, videos, subtitles, and solid colors.
        # See
        # [Overlay using layers](https://imagekit.io/docs/transformations#overlay-using-layers).
        overlay: nil,
        # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
        # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
        # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer). See
        # [Thumbnail extraction](https://imagekit.io/docs/vector-and-animated-images#get-thumbnail-from-psd-pdf-ai-eps-and-animated-files).
        page: nil,
        # Specifies whether the output JPEG image should be rendered progressively.
        # Progressive loading begins with a low-quality, pixelated version of the full
        # image, which gradually improves to provide a faster perceived load time. See
        # [Progressive images](https://imagekit.io/docs/image-optimization#progressive-image---pr).
        progressive: nil,
        # Specifies the quality of the output image for lossy formats such as JPEG, WebP,
        # and AVIF. A higher quality value results in a larger file size with better
        # quality, while a lower value produces a smaller file size with reduced quality.
        # See [Quality](https://imagekit.io/docs/image-optimization#quality---q).
        quality: nil,
        # Specifies the corner radius for rounded corners.
        #
        # - Single value (positive integer): Applied to all corners (e.g., `20`).
        # - `max`: Creates a circular or oval shape.
        # - Per-corner array: Provide four underscore-separated values representing
        #   top-left, top-right, bottom-right, and bottom-left corners respectively (e.g.,
        #   `10_20_30_40`). See
        #   [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
        radius: nil,
        # Pass any transformation not directly supported by the SDK. This transformation
        # string is appended to the URL as provided.
        raw: nil,
        # Specifies the rotation angle in degrees. Positive values rotate the image
        # clockwise; you can also use, for example, `N40` for counterclockwise rotation or
        # `auto` to use the orientation specified in the image's EXIF data. For videos,
        # only the following values are supported: 0, 90, 180, 270, or 360. See
        # [Rotate](https://imagekit.io/docs/effects-and-enhancements#rotate---rt).
        rotation: nil,
        # Adds a shadow beneath solid objects in an image with a transparent background.
        # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
        # shadow, or provide a string for a custom shadow. See
        # [Shadow](https://imagekit.io/docs/effects-and-enhancements#shadow---e-shadow).
        shadow: nil,
        # Sharpens the input image, highlighting edges and finer details. Pass `true` for
        # default sharpening, or provide a numeric value for custom sharpening. See
        # [Sharpen](https://imagekit.io/docs/effects-and-enhancements#sharpen---e-sharpen).
        sharpen: nil,
        # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
        # `10.5`. Arithmetic expressions are also supported. See
        # [Trim videos – Start offset](https://imagekit.io/docs/trim-videos#start-offset---so).
        start_offset: nil,
        # An array of resolutions for adaptive bitrate streaming, e.g., [`240`, `360`,
        # `480`, `720`, `1080`]. See
        # [Adaptive Bitrate Streaming](https://imagekit.io/docs/adaptive-bitrate-streaming).
        streaming_resolutions: nil,
        # Useful for images with a solid or nearly solid background and a central object.
        # This parameter trims the background, leaving only the central object in the
        # output image. See
        # [Trim edges](https://imagekit.io/docs/effects-and-enhancements#trim-edges---t).
        trim: nil,
        # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
        # default unsharp mask, or provide a string for a custom unsharp mask. See
        # [Unsharp Mask](https://imagekit.io/docs/effects-and-enhancements#unsharp-mask---e-usm).
        unsharp_mask: nil,
        # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`. See
        # [Video codec](https://imagekit.io/docs/video-optimization#video-codec---vc).
        video_codec: nil,
        # Specifies the width of the output. If a value between 0 and 1 is provided, it is
        # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
        # can also supply arithmetic expressions (e.g., `iw_div_2`). Width transformation
        # – [Images](https://imagekit.io/docs/image-resize-and-crop#width---w) ·
        # [Videos](https://imagekit.io/docs/video-resize-and-crop#width---w)
        width: nil,
        # Focus using cropped image coordinates - X coordinate. See
        # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
        x: nil,
        # Focus using cropped image coordinates - X center coordinate. See
        # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
        x_center: nil,
        # Focus using cropped image coordinates - Y coordinate. See
        # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
        y_: nil,
        # Focus using cropped image coordinates - Y center coordinate. See
        # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
        y_center: nil,
        # Accepts a numeric value that determines how much to zoom in or out of the
        # cropped area. It should be used in conjunction with fo-face or fo-<object_name>.
        # See [Zoom](https://imagekit.io/docs/image-resize-and-crop#zoom---z).
        zoom: nil
      )
      end

      sig do
        override.returns(
          {
            ai_change_background: String,
            ai_drop_shadow: T.any(T::Boolean, String),
            ai_edit: String,
            ai_remove_background:
              Imagekitio::Transformation::AIRemoveBackground::OrBoolean,
            ai_remove_background_external:
              Imagekitio::Transformation::AIRemoveBackgroundExternal::OrBoolean,
            ai_retouch: Imagekitio::Transformation::AIRetouch::OrBoolean,
            ai_upscale: Imagekitio::Transformation::AIUpscale::OrBoolean,
            ai_variation: Imagekitio::Transformation::AIVariation::OrBoolean,
            aspect_ratio: Imagekitio::Transformation::AspectRatio::Variants,
            audio_codec: Imagekitio::Transformation::AudioCodec::OrSymbol,
            background: String,
            blur: Float,
            border: String,
            color_profile: T::Boolean,
            color_replace: String,
            contrast_stretch:
              Imagekitio::Transformation::ContrastStretch::OrBoolean,
            crop: Imagekitio::Transformation::Crop::OrSymbol,
            crop_mode: Imagekitio::Transformation::CropMode::OrSymbol,
            default_image: String,
            distort: String,
            dpr: Float,
            duration: Imagekitio::Transformation::Duration::Variants,
            end_offset: Imagekitio::Transformation::EndOffset::Variants,
            flip: Imagekitio::Transformation::Flip::OrSymbol,
            focus: String,
            format_: Imagekitio::Transformation::Format::OrSymbol,
            gradient: T.any(T::Boolean, String),
            grayscale: Imagekitio::Transformation::Grayscale::OrBoolean,
            height: Imagekitio::Transformation::Height::Variants,
            lossless: T::Boolean,
            metadata: T::Boolean,
            named: String,
            opacity: Float,
            original: T::Boolean,
            overlay: Imagekitio::Overlay,
            page: Imagekitio::Transformation::Page::Variants,
            progressive: T::Boolean,
            quality: Float,
            radius: T.any(Float, Symbol, String),
            raw: String,
            rotation: Imagekitio::Transformation::Rotation::Variants,
            shadow: T.any(T::Boolean, String),
            sharpen: T.any(T::Boolean, Float),
            start_offset: Imagekitio::Transformation::StartOffset::Variants,
            streaming_resolutions:
              T::Array[Imagekitio::StreamingResolution::OrSymbol],
            trim: T.any(T::Boolean, Float),
            unsharp_mask: T.any(T::Boolean, String),
            video_codec: Imagekitio::Transformation::VideoCodec::OrSymbol,
            width: Imagekitio::Transformation::Width::Variants,
            x: Imagekitio::Transformation::X::Variants,
            x_center: Imagekitio::Transformation::XCenter::Variants,
            y_: Imagekitio::Transformation::Y::Variants,
            y_center: Imagekitio::Transformation::YCenter::Variants,
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
      # inside overlay. See
      # [AI Drop Shadow](https://imagekit.io/docs/ai-transformations#ai-drop-shadow-e-dropshadow).
      module AIDropShadow
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(T::Boolean, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::AIDropShadow::Variants]
          )
        end
        def self.variants
        end
      end

      # Applies ImageKit's in-house background removal. Supported inside overlay. See
      # [AI Background Removal](https://imagekit.io/docs/ai-transformations#imagekit-background-removal-e-bgremove).
      module AIRemoveBackground
        extend Imagekitio::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekitio::Transformation::AIRemoveBackground)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Imagekitio::Transformation::AIRemoveBackground::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Imagekitio::Transformation::AIRemoveBackground::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      # Uses third-party background removal. Note: It is recommended to use
      # aiRemoveBackground, ImageKit's in-house solution, which is more cost-effective.
      # Supported inside overlay. See
      # [External Background Removal](https://imagekit.io/docs/ai-transformations#background-removal-e-removedotbg).
      module AIRemoveBackgroundExternal
        extend Imagekitio::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              Imagekitio::Transformation::AIRemoveBackgroundExternal
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Imagekitio::Transformation::AIRemoveBackgroundExternal::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Imagekitio::Transformation::AIRemoveBackgroundExternal::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      # Performs AI-based retouching to improve faces or product shots. Not supported
      # inside overlay. See
      # [AI Retouch](https://imagekit.io/docs/ai-transformations#retouch-e-retouch).
      module AIRetouch
        extend Imagekitio::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekitio::Transformation::AIRetouch)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekitio::Transformation::AIRetouch::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::AIRetouch::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Upscales images beyond their original dimensions using AI. Not supported inside
      # overlay. See
      # [AI Upscale](https://imagekit.io/docs/ai-transformations#upscale-e-upscale).
      module AIUpscale
        extend Imagekitio::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekitio::Transformation::AIUpscale)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekitio::Transformation::AIUpscale::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::AIUpscale::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Generates a variation of an image using AI. This produces a new image with
      # slight variations from the original, such as changes in color, texture, and
      # other visual elements, while preserving the structure and essence of the
      # original image. Not supported inside overlay. See
      # [AI Generate Variations](https://imagekit.io/docs/ai-transformations#generate-variations-of-an-image-e-genvar).
      module AIVariation
        extend Imagekitio::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekitio::Transformation::AIVariation)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(true, Imagekitio::Transformation::AIVariation::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::AIVariation::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Specifies the aspect ratio for the output, e.g., "ar-4-3". Typically used with
      # either width or height (but not both). For example: aspectRatio = `4:3`, `4_3`,
      # or an expression like `iar_div_2`. See
      # [Image resize and crop – Aspect ratio](https://imagekit.io/docs/image-resize-and-crop#aspect-ratio---ar).
      module AspectRatio
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::AspectRatio::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the audio codec, e.g., `aac`, `opus`, or `none`. See
      # [Audio codec](https://imagekit.io/docs/video-optimization#audio-codec---ac).
      module AudioCodec
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::Transformation::AudioCodec) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AAC = T.let(:aac, Imagekitio::Transformation::AudioCodec::TaggedSymbol)
        OPUS =
          T.let(:opus, Imagekitio::Transformation::AudioCodec::TaggedSymbol)
        NONE =
          T.let(:none, Imagekitio::Transformation::AudioCodec::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::AudioCodec::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Automatically enhances the contrast of an image (contrast stretch). See
      # [Contrast Stretch](https://imagekit.io/docs/effects-and-enhancements#contrast-stretch---e-contrast).
      module ContrastStretch
        extend Imagekitio::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekitio::Transformation::ContrastStretch)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Imagekitio::Transformation::ContrastStretch::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::ContrastStretch::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Crop modes for image resizing. See
      # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      module Crop
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::Transformation::Crop) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FORCE = T.let(:force, Imagekitio::Transformation::Crop::TaggedSymbol)
        AT_MAX = T.let(:at_max, Imagekitio::Transformation::Crop::TaggedSymbol)
        AT_MAX_ENLARGE =
          T.let(:at_max_enlarge, Imagekitio::Transformation::Crop::TaggedSymbol)
        AT_LEAST =
          T.let(:at_least, Imagekitio::Transformation::Crop::TaggedSymbol)
        MAINTAIN_RATIO =
          T.let(:maintain_ratio, Imagekitio::Transformation::Crop::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Crop::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Additional crop modes for image resizing. See
      # [Crop modes & focus](https://imagekit.io/docs/image-resize-and-crop#crop-crop-modes--focus).
      module CropMode
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::Transformation::CropMode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PAD_RESIZE =
          T.let(:pad_resize, Imagekitio::Transformation::CropMode::TaggedSymbol)
        EXTRACT =
          T.let(:extract, Imagekitio::Transformation::CropMode::TaggedSymbol)
        PAD_EXTRACT =
          T.let(
            :pad_extract,
            Imagekitio::Transformation::CropMode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::CropMode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the duration (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to indicate the length from the start offset.
      # Arithmetic expressions are supported. See
      # [Trim videos – Duration](https://imagekit.io/docs/trim-videos#duration---du).
      module Duration
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Duration::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the end offset (in seconds) for trimming videos, e.g., `5` or `10.5`.
      # Typically used with startOffset to define a time window. Arithmetic expressions
      # are supported. See
      # [Trim videos – End offset](https://imagekit.io/docs/trim-videos#end-offset---eo).
      module EndOffset
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::EndOffset::Variants]
          )
        end
        def self.variants
        end
      end

      # Flips or mirrors an image either horizontally, vertically, or both. Acceptable
      # values: `h` (horizontal), `v` (vertical), `h_v` (horizontal and vertical), or
      # `v_h`. See [Flip](https://imagekit.io/docs/effects-and-enhancements#flip---fl).
      module Flip
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::Transformation::Flip) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        H = T.let(:h, Imagekitio::Transformation::Flip::TaggedSymbol)
        V = T.let(:v, Imagekitio::Transformation::Flip::TaggedSymbol)
        H_V = T.let(:h_v, Imagekitio::Transformation::Flip::TaggedSymbol)
        V_H = T.let(:v_h, Imagekitio::Transformation::Flip::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Flip::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the output format for images or videos, e.g., `jpg`, `png`, `webp`,
      # `mp4`, or `auto`. You can also pass `orig` for images to return the original
      # format. ImageKit automatically delivers images and videos in the optimal format
      # based on device support unless overridden by the dashboard settings or the
      # format parameter. See
      # [Image format](https://imagekit.io/docs/image-optimization#format---f) and
      # [Video format](https://imagekit.io/docs/video-optimization#format---f).
      module Format
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::Transformation::Format) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Imagekitio::Transformation::Format::TaggedSymbol)
        WEBP = T.let(:webp, Imagekitio::Transformation::Format::TaggedSymbol)
        JPG = T.let(:jpg, Imagekitio::Transformation::Format::TaggedSymbol)
        JPEG = T.let(:jpeg, Imagekitio::Transformation::Format::TaggedSymbol)
        PNG = T.let(:png, Imagekitio::Transformation::Format::TaggedSymbol)
        GIF = T.let(:gif, Imagekitio::Transformation::Format::TaggedSymbol)
        SVG = T.let(:svg, Imagekitio::Transformation::Format::TaggedSymbol)
        MP4 = T.let(:mp4, Imagekitio::Transformation::Format::TaggedSymbol)
        WEBM = T.let(:webm, Imagekitio::Transformation::Format::TaggedSymbol)
        AVIF = T.let(:avif, Imagekitio::Transformation::Format::TaggedSymbol)
        ORIG = T.let(:orig, Imagekitio::Transformation::Format::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Format::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Creates a linear gradient with two colors. Pass `true` for a default gradient,
      # or provide a string for a custom gradient. See
      # [Gradient](https://imagekit.io/docs/effects-and-enhancements#gradient---e-gradient).
      module Gradient
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(T::Boolean, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Gradient::Variants]
          )
        end
        def self.variants
        end
      end

      # Enables a grayscale effect for images. See
      # [Grayscale](https://imagekit.io/docs/effects-and-enhancements#grayscale---e-grayscale).
      module Grayscale
        extend Imagekitio::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Imagekitio::Transformation::Grayscale)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Imagekitio::Transformation::Grayscale::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Grayscale::TaggedBoolean]
          )
        end
        def self.values
        end
      end

      # Specifies the height of the output. If a value between 0 and 1 is provided, it
      # is treated as a percentage (e.g., `0.5` represents 50% of the original height).
      # You can also supply arithmetic expressions (e.g., `ih_mul_0.5`). Height
      # transformation –
      # [Images](https://imagekit.io/docs/image-resize-and-crop#height---h) ·
      # [Videos](https://imagekit.io/docs/video-resize-and-crop#height---h)
      module Height
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Height::Variants]
          )
        end
        def self.variants
        end
      end

      # Extracts a specific page or frame from multi-page or layered files (PDF, PSD,
      # AI). For example, specify by number (e.g., `2`), a range (e.g., `3-4` for the
      # 2nd and 3rd layers), or by name (e.g., `name-layer-4` for a PSD layer). See
      # [Thumbnail extraction](https://imagekit.io/docs/vector-and-animated-images#get-thumbnail-from-psd-pdf-ai-eps-and-animated-files).
      module Page
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekitio::Transformation::Page::Variants])
        end
        def self.variants
        end
      end

      # Specifies the corner radius for rounded corners.
      #
      # - Single value (positive integer): Applied to all corners (e.g., `20`).
      # - `max`: Creates a circular or oval shape.
      # - Per-corner array: Provide four underscore-separated values representing
      #   top-left, top-right, bottom-right, and bottom-left corners respectively (e.g.,
      #   `10_20_30_40`). See
      #   [Radius](https://imagekit.io/docs/effects-and-enhancements#radius---r).
      module Radius
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, Symbol, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Radius::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the rotation angle in degrees. Positive values rotate the image
      # clockwise; you can also use, for example, `N40` for counterclockwise rotation or
      # `auto` to use the orientation specified in the image's EXIF data. For videos,
      # only the following values are supported: 0, 90, 180, 270, or 360. See
      # [Rotate](https://imagekit.io/docs/effects-and-enhancements#rotate---rt).
      module Rotation
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Rotation::Variants]
          )
        end
        def self.variants
        end
      end

      # Adds a shadow beneath solid objects in an image with a transparent background.
      # For AI-based drop shadows, refer to aiDropShadow. Pass `true` for a default
      # shadow, or provide a string for a custom shadow. See
      # [Shadow](https://imagekit.io/docs/effects-and-enhancements#shadow---e-shadow).
      module Shadow
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(T::Boolean, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Shadow::Variants]
          )
        end
        def self.variants
        end
      end

      # Sharpens the input image, highlighting edges and finer details. Pass `true` for
      # default sharpening, or provide a numeric value for custom sharpening. See
      # [Sharpen](https://imagekit.io/docs/effects-and-enhancements#sharpen---e-sharpen).
      module Sharpen
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(T::Boolean, Float) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Sharpen::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the start offset (in seconds) for trimming videos, e.g., `5` or
      # `10.5`. Arithmetic expressions are also supported. See
      # [Trim videos – Start offset](https://imagekit.io/docs/trim-videos#start-offset---so).
      module StartOffset
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::StartOffset::Variants]
          )
        end
        def self.variants
        end
      end

      # Useful for images with a solid or nearly solid background and a central object.
      # This parameter trims the background, leaving only the central object in the
      # output image. See
      # [Trim edges](https://imagekit.io/docs/effects-and-enhancements#trim-edges---t).
      module Trim
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(T::Boolean, Float) }

        sig do
          override.returns(T::Array[Imagekitio::Transformation::Trim::Variants])
        end
        def self.variants
        end
      end

      # Applies Unsharp Masking (USM), an image sharpening technique. Pass `true` for a
      # default unsharp mask, or provide a string for a custom unsharp mask. See
      # [Unsharp Mask](https://imagekit.io/docs/effects-and-enhancements#unsharp-mask---e-usm).
      module UnsharpMask
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(T::Boolean, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::UnsharpMask::Variants]
          )
        end
        def self.variants
        end
      end

      # Specifies the video codec, e.g., `h264`, `vp9`, `av1`, or `none`. See
      # [Video codec](https://imagekit.io/docs/video-optimization#video-codec---vc).
      module VideoCodec
        extend Imagekitio::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Imagekitio::Transformation::VideoCodec) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        H264 =
          T.let(:h264, Imagekitio::Transformation::VideoCodec::TaggedSymbol)
        VP9 = T.let(:vp9, Imagekitio::Transformation::VideoCodec::TaggedSymbol)
        AV1 = T.let(:av1, Imagekitio::Transformation::VideoCodec::TaggedSymbol)
        NONE =
          T.let(:none, Imagekitio::Transformation::VideoCodec::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::VideoCodec::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Specifies the width of the output. If a value between 0 and 1 is provided, it is
      # treated as a percentage (e.g., `0.4` represents 40% of the original width). You
      # can also supply arithmetic expressions (e.g., `iw_div_2`). Width transformation
      # – [Images](https://imagekit.io/docs/image-resize-and-crop#width---w) ·
      # [Videos](https://imagekit.io/docs/video-resize-and-crop#width---w)
      module Width
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::Width::Variants]
          )
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - X coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      module X
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekitio::Transformation::X::Variants])
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - X center coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      module XCenter
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::XCenter::Variants]
          )
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - Y coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      module Y
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(T::Array[Imagekitio::Transformation::Y::Variants])
        end
        def self.variants
        end
      end

      # Focus using cropped image coordinates - Y center coordinate. See
      # [Focus using cropped coordinates](https://imagekit.io/docs/image-resize-and-crop#example---focus-using-cropped-image-coordinates).
      module YCenter
        extend Imagekitio::Internal::Type::Union

        Variants = T.type_alias { T.any(Float, String) }

        sig do
          override.returns(
            T::Array[Imagekitio::Transformation::YCenter::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
