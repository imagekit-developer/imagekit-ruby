require "date"
require "securerandom"

module ImageKitIo
  module Utils
    module Calculation
      DEFAULT_TIME_DIFF = 60 * 30

      module_function

      def is_valid_hex(hex_string)
        # checks if hexadecimal value is valid or not
        /^[[:xdigit:]]+$/ === hex_string
      end

      def hamming_distance(first, second)
        # Calculate Hamming distance between to hex string
        unless is_valid_hex(first) && is_valid_hex(second)
          raise ArgumentError, "Both argument should be hexadecimal"
        end
        a = first.to_i(16)
        b = second.to_i(16)
        (a ^ b).to_s(2).count("1")
      end

      def get_authenticated_params(token, expire, private_key)
        # return authenticated param
        default_expire = DateTime.now.strftime("%s").to_i + DEFAULT_TIME_DIFF
        token ||= SecureRandom.uuid
        expire ||= default_expire

        auth_params = {'token': token, 'expire': expire, 'signature': ""}
        unless private_key
          return nil
        end

        signature = OpenSSL::HMAC.hexdigest("SHA1", private_key, token.to_s + expire.to_s)
        auth_params[:token] = token
        auth_params[:expire] = expire
        auth_params[:signature] = signature
        auth_params
      end
    end
  end
end
