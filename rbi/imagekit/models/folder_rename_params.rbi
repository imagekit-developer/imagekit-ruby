# typed: strong

module Imagekit
  module Models
    class FolderRenameParams < Imagekit::Internal::Type::BaseModel
      extend Imagekit::Internal::Type::RequestParameters::Converter
      include Imagekit::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Imagekit::FolderRenameParams, Imagekit::Internal::AnyHash)
        end

      # The full path to the folder you want to rename.
      sig { returns(String) }
      attr_accessor :folder_path

      # The new name for the folder.
      #
      # All characters except alphabets and numbers (inclusive of unicode letters,
      # marks, and numerals in other languages) and `-` will be replaced by an
      # underscore i.e. `_`.
      sig { returns(String) }
      attr_accessor :new_folder_name

      # Option to purge cache for the old nested files and their versions' URLs.
      #
      # When set to true, it will internally issue a purge cache request on CDN to
      # remove the cached content of the old nested files and their versions. There will
      # only be one purge request for all the nested files, which will be counted
      # against your monthly purge quota.
      #
      # Note: A purge cache request will be issued against
      # `https://ik.imagekit.io/old/folder/path*` (with a wildcard at the end). This
      # will remove all nested files, their versions' URLs, and any transformations made
      # using query parameters on these files or their versions. However, the cache for
      # file transformations made using path parameters will persist. You can purge them
      # using the purge API. For more details, refer to the purge API documentation.
      #
      # Default value - `false`
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :purge_cache

      sig { params(purge_cache: T::Boolean).void }
      attr_writer :purge_cache

      sig do
        params(
          folder_path: String,
          new_folder_name: String,
          purge_cache: T::Boolean,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The full path to the folder you want to rename.
        folder_path:,
        # The new name for the folder.
        #
        # All characters except alphabets and numbers (inclusive of unicode letters,
        # marks, and numerals in other languages) and `-` will be replaced by an
        # underscore i.e. `_`.
        new_folder_name:,
        # Option to purge cache for the old nested files and their versions' URLs.
        #
        # When set to true, it will internally issue a purge cache request on CDN to
        # remove the cached content of the old nested files and their versions. There will
        # only be one purge request for all the nested files, which will be counted
        # against your monthly purge quota.
        #
        # Note: A purge cache request will be issued against
        # `https://ik.imagekit.io/old/folder/path*` (with a wildcard at the end). This
        # will remove all nested files, their versions' URLs, and any transformations made
        # using query parameters on these files or their versions. However, the cache for
        # file transformations made using path parameters will persist. You can purge them
        # using the purge API. For more details, refer to the purge API documentation.
        #
        # Default value - `false`
        purge_cache: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            folder_path: String,
            new_folder_name: String,
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
