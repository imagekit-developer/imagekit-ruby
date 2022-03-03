module ImageKitIo
  module Constants
    module File
      VALID_FILE_OPTIONS = %w[path fileType tags includeFolder name limit skip]

      VALID_FILE_DETAIL_OPTIONS = ["fileID"]

      VALID_UPLOAD_OPTIONS = %w[file file_name use_unique_file_name tags folder is_private_file custom_coordinates response_fields extensions webhook_url overwrite_file overwrite_AI_tags overwrite_custom_metadata custom_metadata mime overwrite_tags content_type  ]
    end
  end
end
