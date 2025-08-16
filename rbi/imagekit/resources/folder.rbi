# typed: strong

module Imagekit
  module Resources
    class Folder
      # This will create a new folder. You can specify the folder name and location of
      # the parent folder where this new folder should be created.
      sig do
        params(
          folder_name: String,
          parent_folder_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def create(
        # The folder will be created with this name.
        #
        # All characters except alphabets and numbers (inclusive of unicode letters,
        # marks, and numerals in other languages) will be replaced by an underscore i.e.
        # `_`.
        folder_name:,
        # The folder where the new folder should be created, for root use `/` else the
        # path e.g. `containing/folder/`.
        #
        # Note: If any folder(s) is not present in the parentFolderPath parameter, it will
        # be automatically created. For example, if you pass `/product/images/summer`,
        # then `product`, `images`, and `summer` folders will be created if they don't
        # already exist.
        parent_folder_path:,
        request_options: {}
      )
      end

      # This will delete a folder and all its contents permanently. The API returns an
      # empty response.
      sig do
        params(
          folder_path: String,
          request_options: Imagekit::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def delete(
        # Full path to the folder you want to delete. For example `/folder/to/delete/`.
        folder_path:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Imagekit::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
