# frozen_string_literal: true

module Imagekit
  module Helpers
    # Transformation utilities for building ImageKit URLs
    # Ported from the Node.js SDK
    module TransformationUtils
      # Constants for transformation parsing
      QUERY_TRANSFORMATION_POSITION = :query
      PATH_TRANSFORMATION_POSITION = :path
      CHAIN_TRANSFORM_DELIMITER = ":"
      TRANSFORM_DELIMITER = ","
      TRANSFORM_KEY_VALUE_DELIMITER = "-"

      # Supported transformations mapping
      # Based on https://imagekit.io/docs/transformations
      SUPPORTED_TRANSFORMS = {
        # Basic sizing & layout
        "width" => "w",
        "height" => "h",
        "aspect_ratio" => "ar",
        "aspectRatio" => "ar",
        "background" => "bg",
        "border" => "b",
        "crop" => "c",
        "crop_mode" => "cm",
        "cropMode" => "cm",
        "dpr" => "dpr",
        "focus" => "fo",
        "quality" => "q",
        "x" => "x",
        "x_center" => "xc",
        "xCenter" => "xc",
        "y" => "y",
        "y_" => "y",
        "y_center" => "yc",
        "yCenter" => "yc",
        "format" => "f",
        "format_" => "f",
        "video_codec" => "vc",
        "videoCodec" => "vc",
        "audio_codec" => "ac",
        "audioCodec" => "ac",
        "radius" => "r",
        "rotation" => "rt",
        "blur" => "bl",
        "named" => "n",
        "default_image" => "di",
        "defaultImage" => "di",
        "flip" => "fl",
        "original" => "orig",
        "start_offset" => "so",
        "startOffset" => "so",
        "end_offset" => "eo",
        "endOffset" => "eo",
        "duration" => "du",
        "streaming_resolutions" => "sr",
        "streamingResolutions" => "sr",

        # AI & advanced effects
        "grayscale" => "e-grayscale",
        "ai_upscale" => "e-upscale",
        "aiUpscale" => "e-upscale",
        "ai_retouch" => "e-retouch",
        "aiRetouch" => "e-retouch",
        "ai_variation" => "e-genvar",
        "aiVariation" => "e-genvar",
        "ai_drop_shadow" => "e-dropshadow",
        "aiDropShadow" => "e-dropshadow",
        "ai_change_background" => "e-changebg",
        "aiChangeBackground" => "e-changebg",
        "ai_remove_background" => "e-bgremove",
        "aiRemoveBackground" => "e-bgremove",
        "ai_remove_background_external" => "e-removedotbg",
        "aiRemoveBackgroundExternal" => "e-removedotbg",
        "ai_edit" => "e-edit",
        "aiEdit" => "e-edit",
        "contrast_stretch" => "e-contrast",
        "contrastStretch" => "e-contrast",
        "shadow" => "e-shadow",
        "sharpen" => "e-sharpen",
        "unsharp_mask" => "e-usm",
        "unsharpMask" => "e-usm",
        "gradient" => "e-gradient",

        # Other flags & finishing
        "progressive" => "pr",
        "lossless" => "lo",
        "color_profile" => "cp",
        "colorProfile" => "cp",
        "metadata" => "md",
        "opacity" => "o",
        "trim" => "t",
        "zoom" => "z",
        "page" => "pg",

        # Text overlay transformations
        "font_size" => "fs",
        "fontSize" => "fs",
        "font_family" => "ff",
        "fontFamily" => "ff",
        "font_color" => "co",
        "fontColor" => "co",
        "inner_alignment" => "ia",
        "innerAlignment" => "ia",
        "padding" => "pa",
        "alpha" => "al",
        "typography" => "tg",
        "line_height" => "lh",
        "lineHeight" => "lh",

        # Subtitles transformations
        "font_outline" => "fol",
        "fontOutline" => "fol",
        "font_shadow" => "fsh",
        "fontShadow" => "fsh",
        "color" => "co",

        # Raw pass-through
        "raw" => "raw"
      }.freeze

      class << self
        # Check if transformations should be added as query parameter
        def add_as_query_parameter?(options)
          options[:transformation_position] == QUERY_TRANSFORMATION_POSITION ||
            options["transformation_position"] == QUERY_TRANSFORMATION_POSITION ||
            options[:transformation_position] == "query" ||
            options["transformation_position"] == "query"
        end

        # Get transformation key from supported transforms
        def get_transform_key(transform)
          return "" if transform.nil? || transform.to_s.empty?

          transform_str = transform.to_s
          SUPPORTED_TRANSFORMS[transform_str] ||
            SUPPORTED_TRANSFORMS[transform_str.downcase] ||
            ""
        end

        # Get chain transform delimiter
        def get_chain_transform_delimiter
          CHAIN_TRANSFORM_DELIMITER
        end

        # Get transform delimiter
        def get_transform_delimiter
          TRANSFORM_DELIMITER
        end

        # Get transform key-value delimiter
        def get_transform_key_value_delimiter
          TRANSFORM_KEY_VALUE_DELIMITER
        end

        # Safe base64 encoding
        def safe_btoa(str)
          require("base64")
          Base64.strict_encode64(str)
        end
      end
    end
  end
end
