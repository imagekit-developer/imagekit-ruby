# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      class RequestBandwidthEntry < Imagekitio::Internal::Type::BaseModel
        # @!attribute bandwidth_bytes
        #   Total bandwidth used in bytes.
        #
        #   @return [Float]
        required :bandwidth_bytes, Float, api_name: :bandwidthBytes

        # @!attribute request_count
        #   Number of requests.
        #
        #   @return [Float]
        required :request_count, Float, api_name: :requestCount

        # @!method initialize(bandwidth_bytes:, request_count:)
        #   @param bandwidth_bytes [Float] Total bandwidth used in bytes.
        #
        #   @param request_count [Float] Number of requests.
      end
    end
  end
end
