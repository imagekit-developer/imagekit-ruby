# frozen_string_literal: true

# Enum for defaults
module ImageKitIo
  module Constants
    module Default
      TRANSFORMATION_POSITION = "path"
      QUERY_TRANSFORMATION_POSITION = "query"
      VALID_TRANSFORMATION_POSITION = [TRANSFORMATION_POSITION,
                                       QUERY_TRANSFORMATION_POSITION,].freeze
      DEFAULT_TIMESTAMP = "9999999999"
      TRANSFORMATION_PARAMETER = "tr"
      CHAIN_TRANSFORM_DELIMITER = ":"
      TRANSFORM_DELIMITER = ","
      TRANSFORM_KEY_VALUE_DELIMITER = "-"

      SIGNATURE_PARAMETER = "ik-s"
      TIMESTAMP_PARAMETER = "ik-t"
      TIMESTAMP = "9999999999"
    end
  end
end
