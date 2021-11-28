require_relative './formatter'

module ImageKitIo
  module Utils
    module OptionValidator
      include Formatter

      module_function

      def validate_upload_options(options)

        #  Validates upload value, checks if params are valid,
        #  changes snake to camel case which is supported by
        #  ImageKitIo server


        response_list = []
        options.each do |key, val|
          if constants.VALID_UPLOAD_OPTIONS.include?(key.to_s)
            if val.is_a?(Array)
              val = val.join(",")
            end
            if val.is_a?(TrueClass) || val.is_a?(FalseClass)
              val = val.to_s
            end
            options[key] = val
          else
            return false
          end
        end
        request_formatter(options)
      end
    end
  end
end
