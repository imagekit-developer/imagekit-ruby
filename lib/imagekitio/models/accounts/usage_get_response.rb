# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::Usage#get
      class UsageGetResponse < Imagekitio::Internal::Type::BaseModel
        # @!attribute bandwidth_bytes
        #   Amount of bandwidth used in bytes.
        #
        #   @return [Integer, nil]
        optional :bandwidth_bytes, Integer, api_name: :bandwidthBytes

        # @!attribute extension_units_count
        #   Number of extension units used.
        #
        #   @return [Integer, nil]
        optional :extension_units_count, Integer, api_name: :extensionUnitsCount

        # @!attribute media_library_storage_bytes
        #   Storage used by media library in bytes.
        #
        #   @return [Integer, nil]
        optional :media_library_storage_bytes, Integer, api_name: :mediaLibraryStorageBytes

        # @!attribute original_cache_storage_bytes
        #   Storage used by the original cache in bytes.
        #
        #   @return [Integer, nil]
        optional :original_cache_storage_bytes, Integer, api_name: :originalCacheStorageBytes

        # @!attribute video_processing_units_count
        #   Number of video processing units used.
        #
        #   @return [Integer, nil]
        optional :video_processing_units_count, Integer, api_name: :videoProcessingUnitsCount

        # @!method initialize(bandwidth_bytes: nil, extension_units_count: nil, media_library_storage_bytes: nil, original_cache_storage_bytes: nil, video_processing_units_count: nil)
        #   @param bandwidth_bytes [Integer] Amount of bandwidth used in bytes.
        #
        #   @param extension_units_count [Integer] Number of extension units used.
        #
        #   @param media_library_storage_bytes [Integer] Storage used by media library in bytes.
        #
        #   @param original_cache_storage_bytes [Integer] Storage used by the original cache in bytes.
        #
        #   @param video_processing_units_count [Integer] Number of video processing units used.
      end
    end
  end
end
