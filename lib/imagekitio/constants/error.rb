module ImageKitIo
  module Constants
    module Error
      MANDATORY_INIT_MISSING = {
        'message': "Missing public_key or private_key or url_endpoint during ImageKitIo initialization",
        help: "",
      }
      INVALID_TRANSFORMATION_POS = {'message': "Invalid transformationPosition parameter",
                                    help: "",}
      INVALID_URL_GENERATION_PARAM = {'message': "Invalid url parameter", help: ""}
      INVALID_TRANSFORMATION_OPTIONS = {
        'message': "Invalid transformation parameter options",
        help: "",
      }
      CACHE_PURGE_URL_MISSING = {'message': "Missing URL parameter for this request",
                                 help: "",}
      CACHE_PURGE_STATUS_ID_MISSING = {'message': "Missing Request ID parameter for this request",
                                       help: "",}
      FILE_ID_MISSING = {'message': "Missing File ID parameter for this request",
                         help: "",}
      UPDATE_DATA_MISSING = {'message': "Missing file update data for this request",
                             help: "",}

      UPDATE_DATA_TAGS_INVALID = {'message': "Invalid tags parameter for this request",
                                  help: "tags should be passed as null or an array like ['tag1', 'tag2']",}.freeze

      UPDATE_DATA_COORDS_INVALID =
        {'message': "Invalid custom_coordinates parameter for this request",
         help: "custom_coordinates should be passed as null or a string like 'x,y,width,height'",}

      LIST_FILES_INPUT_MISSING = {
        'message': "Missing options for list files",
        help: "If you do not want to pass any parameter for listing, pass an empty object",
      }
      MISSING_FILE_URL = {'message': "Missing file_url for purge_cache", help: ""}
      MISSING_UPLOAD_DATA = {'message': "Missing data for upload", help: ""}
      MISSING_UPLOAD_FILE_PARAMETER = {
        'message': "Missing file parameter for upload",
        help: "",
      }
      MISSING_UPLOAD_FILENAME_PARAM = {
        'message': "Missing fileName parameter for upload",
        help: "",
      }

      INVALID_PHASH_VALUE =
        {
          'message': "Invalid pHash value",
          help: "Both pHash strings must be valid hexadecimal numbers",
        }

      MISSING_PHASH_VALUE = {
        'message': "Missing pHash value",
        help: "Please pass two pHash values",
      }
      UNEQUAL_STRING_LENGTH = {
        '': "Unequal pHash string length",
        help: "For distance calculation, the two pHash strings must have equal length",
      }

      MISSING_PRIVATE_KEY = "ImageKitIo private key missing"

      MISSING_PUBLIC_KEY = "ImageKitIo public key missing"

      MISSING_URL_ENDPOINT = "ImageKitIo URL Endpoint missing. Default URL Endpoint: https://ik.imagekit.io/<YOUR_IMAGEKIT_ID>/"

    end
  end
end
