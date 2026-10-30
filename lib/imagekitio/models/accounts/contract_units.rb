# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      class ContractUnits < Imagekitio::Internal::Type::BaseModel
        # @!attribute bandwidth_bytes
        #   Bandwidth in bytes.
        #
        #   @return [Integer]
        required :bandwidth_bytes, Integer, api_name: :bandwidthBytes

        # @!attribute extension_units_count
        #   Number of extension units.
        #
        #   @return [Integer]
        required :extension_units_count, Integer, api_name: :extensionUnitsCount

        # @!attribute purge_cache_requests
        #   Number of purge cache requests.
        #
        #   @return [Integer]
        required :purge_cache_requests, Integer, api_name: :purgeCacheRequests

        # @!attribute video_processing_units_count
        #   Number of video processing units.
        #
        #   @return [Integer]
        required :video_processing_units_count, Integer, api_name: :videoProcessingUnitsCount

        # @!method initialize(bandwidth_bytes:, extension_units_count:, purge_cache_requests:, video_processing_units_count:)
        #   @param bandwidth_bytes [Integer] Bandwidth in bytes.
        #
        #   @param extension_units_count [Integer] Number of extension units.
        #
        #   @param purge_cache_requests [Integer] Number of purge cache requests.
        #
        #   @param video_processing_units_count [Integer] Number of video processing units.
      end
    end
  end
end
