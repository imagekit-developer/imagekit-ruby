# typed: strong

module Imagekitio
  module Models
    module Accounts
      class UsageGetResponse < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Models::Accounts::UsageGetResponse,
              Imagekitio::Internal::AnyHash
            )
          end

        # Amount of bandwidth used in bytes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :bandwidth_bytes

        sig { params(bandwidth_bytes: Integer).void }
        attr_writer :bandwidth_bytes

        # Number of extension units used.
        sig { returns(T.nilable(Integer)) }
        attr_reader :extension_units_count

        sig { params(extension_units_count: Integer).void }
        attr_writer :extension_units_count

        # Storage used by media library in bytes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :media_library_storage_bytes

        sig { params(media_library_storage_bytes: Integer).void }
        attr_writer :media_library_storage_bytes

        # Storage used by the original cache in bytes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :original_cache_storage_bytes

        sig { params(original_cache_storage_bytes: Integer).void }
        attr_writer :original_cache_storage_bytes

        # Number of video processing units used.
        sig { returns(T.nilable(Integer)) }
        attr_reader :video_processing_units_count

        sig { params(video_processing_units_count: Integer).void }
        attr_writer :video_processing_units_count

        sig do
          params(
            bandwidth_bytes: Integer,
            extension_units_count: Integer,
            media_library_storage_bytes: Integer,
            original_cache_storage_bytes: Integer,
            video_processing_units_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Amount of bandwidth used in bytes.
          bandwidth_bytes: nil,
          # Number of extension units used.
          extension_units_count: nil,
          # Storage used by media library in bytes.
          media_library_storage_bytes: nil,
          # Storage used by the original cache in bytes.
          original_cache_storage_bytes: nil,
          # Number of video processing units used.
          video_processing_units_count: nil
        )
        end

        sig do
          override.returns(
            {
              bandwidth_bytes: Integer,
              extension_units_count: Integer,
              media_library_storage_bytes: Integer,
              original_cache_storage_bytes: Integer,
              video_processing_units_count: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
