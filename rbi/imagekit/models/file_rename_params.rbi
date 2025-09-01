# typed: strong

module Imagekit
  module Models
    class FileRenameParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FileRenameParams, Imagekit::Internal::AnyHash)
        end

      # The full path of the file you want to rename.
      sig { returns(String) }
      attr_accessor :file_path

      # The new name of the file. A filename can contain:
      #
      # Alphanumeric Characters: `a-z`, `A-Z`, `0-9` (including Unicode letters, marks,
      # and numerals in other languages). Special Characters: `.`, `_`, and `-`.
      #
      # Any other character, including space, will be replaced by `_`.
      sig { returns(String) }
      attr_accessor :new_file_name

      # Option to purge cache for the old file and its versions' URLs.
      #
      # When set to true, it will internally issue a purge cache request on CDN to
      # remove cached content of old file and its versions. This purge request is
      # counted against your monthly purge quota.
      #
      # Note: If the old file were accessible at
      # `https://ik.imagekit.io/demo/old-filename.jpg`, a purge cache request would be
      # issued against `https://ik.imagekit.io/demo/old-filename.jpg*` (with a wildcard
      # at the end). It will remove the file and its versions' URLs and any
      # transformations made using query parameters on this file or its versions.
      # However, the cache for file transformations made using path parameters will
      # persist. You can purge them using the purge API. For more details, refer to the
      # purge API documentation.
      #
      # Default value - `false`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :purge_cache

      sig { params(purge_cache: T::Boolean).void }
      attr_writer :purge_cache

      sig do
        params(
          file_path: String,
          new_file_name: String,
          purge_cache: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The full path of the file you want to rename.
        file_path:,
        # The new name of the file. A filename can contain:
        #
        # Alphanumeric Characters: `a-z`, `A-Z`, `0-9` (including Unicode letters, marks,
        # and numerals in other languages). Special Characters: `.`, `_`, and `-`.
        #
        # Any other character, including space, will be replaced by `_`.
        new_file_name:,
        # Option to purge cache for the old file and its versions' URLs.
        #
        # When set to true, it will internally issue a purge cache request on CDN to
        # remove cached content of old file and its versions. This purge request is
        # counted against your monthly purge quota.
        #
        # Note: If the old file were accessible at
        # `https://ik.imagekit.io/demo/old-filename.jpg`, a purge cache request would be
        # issued against `https://ik.imagekit.io/demo/old-filename.jpg*` (with a wildcard
        # at the end). It will remove the file and its versions' URLs and any
        # transformations made using query parameters on this file or its versions.
        # However, the cache for file transformations made using path parameters will
        # persist. You can purge them using the purge API. For more details, refer to the
        # purge API documentation.
        #
        # Default value - `false`
        purge_cache: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            file_path: String,
            new_file_name: String,
            purge_cache: T::Boolean,
            request_options: Imagekit::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
