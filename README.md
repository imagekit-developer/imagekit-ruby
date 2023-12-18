[<img width="250" alt="ImageKit.io" src="https://raw.githubusercontent.com/imagekit-developer/imagekit-javascript/master/assets/imagekit-light-logo.svg"/>](https://imagekit.io)

# Imagekit Ruby and Rails SDK

[![Ruby Test](https://github.com/imagekit-developer/imagekit-ruby/workflows/Ruby%20Test/badge.svg)](https://github.com/imagekit-developer/imagekit-ruby)
[![Gem Version](https://badge.fury.io/rb/imagekitio.svg)](https://badge.fury.io/rb/imagekitio)
[![codecov](https://codecov.io/gh/imagekit-developer/imagekit-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/imagekit-developer/imagekit-ruby)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Twitter Follow](https://img.shields.io/twitter/follow/imagekitio?label=Follow&style=social)](https://twitter.com/ImagekitIo)

Ruby on Rails gem for [ImageKit](https://imagekit.io/) implements the new APIs and interface for different file operations.

ImageKit is complete media storage, optimization, and transformation solution that comes with an [image and video CDN](https://imagekit.io/features/imagekit-infrastructure). It can be integrated with your existing infrastructure - storage like AWS S3, web servers, your CDN, and custom domain names, allowing you to deliver optimized images in minutes with minimal code changes.

Table of contents -
 * [Installation](#installation)
 * [Initialization](#initialization)
    - [CarrierWave](#carrierwave)
    - [ActiveStorage](#activestorage)
 * [URL Generation](#url-generation)
 * [File Upload](#file-upload)
 * [File Management](#file-management)
 * [Utility Functions](#utility-functions)
 * [Sample applications](#sample-application)
 * [Upgrade to 2.x](#upgrade-to-2x)
 * [Support](#support)
 * [Links](#links)


# Quick start guide
Get started with [official quick start guide](https://docs.imagekit.io/getting-started/quickstart-guides/ruby-on-rails) for integrating ImageKit in Ruby on Rails.

## Installation

Add `imagekitio` dependency to your application's Gemfile:

```ruby
gem 'imagekitio'
```

And then execute:
```
$ bundle install
```

Or install it yourself:
```
$ gem install imagekitio
```

## Initialization

Create a new file `config/initializers/imagekitio.rb` then add the configuration.
```ruby
ImageKitIo.configure do |config|
  if Rails.env.development?
    config.public_key = 'your_public_api_key'
    config.private_key = 'your_private_api_key'
    config.url_endpoint = 'https://ik.imagekit.io/your_imagekit_id/'
  end
  config.service = :carrierwave
  #config.service = :active_storage
  #config.constants.MISSING_PRIVATE_KEY = 'custom error message'
end
```
#### CarrierWave
You can create a CarrierWave uploader to attach pictures to your database objects as their attributes. Skip to [this section](https://github.com/imagekit-developer/imagekit-ruby#file-upload) to upload images without designating them as database attributes. Make sure to add service `:carrierwave` as shown in [initialization section](#initialization).

```bash
rails g uploader <Uploading_attribute_name>
# For example, if you want to create an uploader for Avatar attribute, then use
rails g uploader Avatar
# Generated uploader's path will be app/uploaders/avatar_uploader.rb
```

After that, you need to edit your generated uploader and make the following changes:
```ruby
# include this module inside the top of the uploader class
include ImageKitIo::CarrierWave

# If you want to add uploading options, then create this method inside the uploader file as an example

def options
    options={
        response_fields: 'isPrivateFile, tags',
        tags: %w[abc def],
        use_unique_file_name: false,
        folder: "your_directory/"
    }
end

# If you want to set upload dir, then you can use the following method, or you can also use the options method.
# This method should return a string
def store_dir
    "your_directory/"
end
```

Then you need to modify your model. for example- if your model name is employee, then do these changes.

```ruby
class Employee < ApplicationRecord
    attr_accessor :avatar
    mount_uploader :avatar, AvatarUploader
end
```

Get image url:
```ruby
# If @employee is an object of your model that has data.

# To get the original image url, use
@employee.avatar.url

# To get the file metadata
@employee.avatar.metadata


# And to get transformed url use
# options is a transformation options
@employee.avatar.url_with(options)
```

#### ActiveStorage

Once you [install](https://guides.rubyonrails.org/active_storage_overview.html#setup) the active_storage gem, then any model can have the attachment using `has_one_attached` or `has_many_attached` like below:

```ruby
class Employee < ApplicationRecord
  has_one_attached :avatar
end
```

Get image url:
```ruby
# If @employee is an object of your model that has data.

# To get the original image url, use
@employee.avatar.url
```

Now, let's configure active_storage as a service for the imagekitio. 

First add `:active_storage` in initializer file.

```ruby
config.service = :active_storage
``` 

Then add the imagekitio service in the `storage.yml` file:

```ruby
imagekitio:
    service: ImageKitIo
```


## Usage

You can use this Ruby SDK for three different methods - URL generation, file upload, and media management operations. The usage of the SDK has been explained below.

* `URL Generation`
* `File Upload`
* `File Management`

## URL generation

**1. Using Image path and image hostname or endpoint**

This method allows you to create an URL to access a file using the relative file path and the ImageKit URL endpoint (`urlEndpoint`). The file can be an image, video or any other static file supported by ImageKit.

```ruby
imagekitio = ImageKitIo.client
image_url = imagekitio.url({
    path: "/default-image.jpg",
    url_endpoint: "https://ik.imagekit.io/your_imagekit_id/endpoint/",
    transformation: [{height: "300", width: "400", raw: "ar-4-3,q-40"}]
})
```

The result in a URL like
```
https://ik.imagekit.io/your_imagekit_id/endpoint/tr:h-300,w-400,ar-4-3,q-40/default-image.jpg
```

**2.Using full image URL**
This method allows you to add transformation parameters to an absolute URL. For example, if you have configured a custom CNAME and have absolute asset URLs in your database or CMS, you will often need this.


```ruby
image_url = imagekitio.url({
    src: "https://ik.imagekit.io/your_imagekit_id/endpoint/default-image.jpg",
    transformation: [{height: "300", width: "400"}],
})
```

The results in a URL like

```
https://ik.imagekit.io/your_imagekit_id/endpoint/default-image.jpg?tr=h-300%2Cw-400
```


The `.url()` method accepts the following parameters

| Option                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| :---------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| url_endpoint            | Optional. The base URL to be appended before the path of the image. If not specified, the URL Endpoint specified at the time of SDK initialization is used. For example, https://ik.imagekit.io/your_imagekit_id/endpoint/                                                                                                                                                                                                                                                                                                                                                                |
| path                    | Conditional. This is the path at which the image exists. For example, `/path/to/image.jpg`. Either the `path` or `src` parameter needs to be specified for URL generation.                                                                                                                                                                                                                                                                                                                                                                                                                 |
| src                     | Conditional. This is the complete URL of an image already mapped to ImageKit. For example, `https://ik.imagekit.io/your_imagekit_id/endpoint/path/to/image.jpg`. Either the `path` or `src` parameter needs to be specified for URL generation.                                                                                                                                                                                                                                                                                                                                            |
| transformation          | Optional. An array of objects specifying the transformation to be applied in the URL. The transformation name and the value should be specified as a key-value pair in the object. Different steps of a [chained transformation](https://docs.imagekit.io/features/image-transformations/chained-transformations) can be specified as different objects of the array. The complete list of supported transformations in the SDK and some examples of using them are given later. If you use a transformation name that is not specified in the SDK, it gets applied as it is in the URL. |
| transformation_position | Optional. The default value is `path` that places the transformation string as a path parameter in the URL. It can also be specified as `query`, which adds the transformation string as the query parameter `tr` in the URL. If you use `src` parameter to create the URL, then the transformation string is always added as a query parameter.                                                                                                                                                                                                                                                  |
| query_parameters        | Optional. These are the other query parameters that you want to add to the final URL. These can be any query parameters and not necessarily related to ImageKit. Especially useful if you want to add some versioning parameters to your URLs.                                                                                                                                                                                                                                                                                                                                            |
| signed                  | Optional. Boolean. Default is `false`. If set to `true`, the SDK generates a signed image URL adding the image signature to the image URL. This can only be used if you are creating the URL with the `url_endpoint` and `path` parameters and not with the `src` parameter.                                                                                                                                                                                                                                                                                                             |
| expire_seconds          | Optional. Integer. Meant to be used along with the `signed` parameter to specify the time in seconds from now when the URL should expire. If specified, the URL contains the expiry timestamp in the URL, and the image signature is modified accordingly.                                                                                                                                                                                                                                                                                                                                 |


## Examples of generating URLs
**1. Chained Transformations as a query parameter**

```ruby
image_url = imagekitio.url({
    path: "/default-image.jpg",
    url_endpoint: "https://ik.imagekit.io/your_imagekit_id/endpoint/",
    transformation: [{
        height: "300",
        width: "400"
    },{
        rotation: 90
    }],
    transformation_position: "query"
})
```
Sample Result URL -
```
https://ik.imagekit.io/your_imagekit_id/endpoint/default-image.jpg?tr=h-300%2Cw-400%3Art-90
```

**2. Sharpening and contrast transforms and a progressive JPG image**

There are some transforms like [Sharpening](https://docs.imagekit.io/features/image-transformations/image-enhancement-and-color-manipulation)
that can be added to the URL with or without any other value. To use such transforms without specifying a value, specify
the value as "-" in the transformation object. Otherwise, specify the value that you want to be
added to this transformation.


```ruby
image_url = imagekitio.url({
    src: "https://ik.imagekit.io/your_imagekit_id/endpoint/default-image.jpg",
    transformation: [{
        format: "jpg",
        progressive: "true",
        effect_sharpen: "-",
        effect_contrast: "1"
    }]
})
```

```
//Note that because `src` parameter was used, the transformation string gets added as a query parameter `tr`
https://ik.imagekit.io/your_imagekit_id/endpoint/default-image.jpg?tr=f-jpg%2Cpr-true%2Ce-sharpen%2Ce-contrast-1
```

**3. Signed URL that expires in 300 seconds with the default URL endpoint and other query parameters**

```ruby
image_url = imagekit.url({
    path: "/default-image",
    query_parameters: {
                "v": "123"
    },
    transformation: [{
        height: "300",
        width: "400"
    }],
    signed: True,
    expire_seconds: 300
})
```
**Sample Result URL**
```
https://ik.imagekit.io/your_imagekit_id/tr:h-300,w-400/default-image.jpg?v=123&ik-t=1567358667&ik-s=f2c7cdacbe7707b71a83d49cf1c6110e3d701054
```

**4. Adding overlays to images**

ImageKit.io allows you to add [text](https://docs.imagekit.io/features/image-transformations/overlay-using-layers#add-text-over-image) and [image overlay](https://docs.imagekit.io/features/image-transformations/overlay-using-layers#add-images-over-image) dynamically.

For example:

```ruby
image_url = imagekit.url({
    path: "/default-image",
    url_endpoint: "https://ik.imagekit.io/your_imagekit_id/endpoint/",
    transformation: [{
        height: "300",
        width: "400",
        raw: "l-image,i-default-image.jpg,w-100,b-10_CDDC39,l-end"
    }],
})
```
**Sample Result URL**
```
https://ik.imagekit.io/your_imagekit_id/tr:h-300,w-400,l-image,i-default-image.jpg,w-100,b-10_CDDC39,l-end/default-image.jpg
```

**List of transformations**

The complete list of transformations supported and their usage in ImageKit can be found [here](https://docs.imagekit.io/features/image-transformations/resize-crop-and-other-transformations). The SDK gives a name to each transformation parameter, making the code simpler, making the code simpler, and readable.

If a transformation is supported in ImageKit, but a name for it cannot be found in the table below, then use the transformation code from ImageKit docs as the name when using the `url` function.

If you want to generate transformations in your application and add them to the URL as it is, use the `raw` parameter.

| Supported Transformation Name | Translates to parameter |
|-------------------------------|-------------------------|
| height | h |
| width | w |
| aspectRatio | ar |
| quality | q |
| crop | c |
| cropMode | cm |
| x | x |
| y | y |
| focus | fo |
| format | f |
| radius | r |
| background | bg |
| border | b |
| rotation | rt |
| blur | bl |
| named | n |
| progressive | pr |
| lossless | lo |
| trim | t |
| metadata | md |
| colorProfile | cp |
| defaultImage | di |
| dpr | dpr |
| effectSharpen | e-sharpen |
| effectUSM | e-usm |
| effectContrast | e-contrast |
| effectGray | e-grayscale |
| original | orig |
| raw | `replaced by the parameter value` |

## File Upload
This method can be used to directly upload images to your ImageKit Media Library without giving it the designation of an attribute of any database object.

The SDK provides a simple interface using the `.upload()` method to upload files to the ImageKit Media library. It
accepts all the parameters supported by the [ImageKit Upload API](https://docs.imagekit.io/api-reference/upload-file-api/server-side-file-upload).

The `upload()` method requires at least the `file` and the `file_name` parameter to upload a file and returns
a callback with the `error` and `result`  as arguments. You can pass other parameters supported by the
ImageKit upload API using the same parameter name as specified in the upload API documentation. For example, to specify tags for a file at the time of upload, use the `tags` parameter as specified in the [documentation here](https://docs.imagekit.io/api-reference/upload-file-api/server-side-file-upload).

Simple usage

```ruby
imagekitio.upload_file(
    file: "<url|base_64|binary>", # required
    file_name: "my_file_name.jpg",  # required
    response_fields: 'isPrivateFile, tags',
    tags: %w[abc def],
    use_unique_file_name: true
)

```

If the upload is succeeded, `error` will be `None`, and the result will be the same as what is received from ImageKit's
servers. If the upload fails, `error` will be the same as what is received from ImageKit's servers, and the result will
be `None`.

## File Management

The SDK provides a simple interface for all the [media APIs mentioned here](https://docs.imagekit.io/api-reference/media-api)
to manage your files. This also returns `error` and `result`. The `error` will be `None` if API succeeds.

**List & Search Files**

Accepts an object specifying the parameters to be used to list and search files. All parameters specified
in the [documentation here](https://docs.imagekit.io/api-reference/media-api/list-and-search-files#list-and-search-file-api) can be passed with the
correct values to get the results.

```ruby
imagekitio.list_files(
    skip: 0,
    limit: 5
)
```
**Get File Details**
Accepts the file ID and fetches the details as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/get-file-details)

```ruby
imagekitio.get_file_details(
    file_id: '598821f949c0a938d57563bd'
)
```

**Get File Metadata**
Accepts the file ID and fetches the metadata as per the [API documentation here](https://docs.imagekit.io/api-reference/metadata-api/get-image-metadata-for-uploaded-media-files)
```ruby
imagekit.get_file_metadata(
    file_id: '598821f949c0a938d57563bd'
)
```

**Get File Metadata from remote url**
Accepts the remote file url and fetches the metadata as per the [API documentation here](https://docs.imagekit.io/api-reference/metadata-api/get-image-metadata-from-remote-url)

```ruby
imagekit.get_remote_file_url_metadata(
    remote_file_url: "https://ik.imagekit.io/demo/tr:w-100/default-image.jpg"
)
```

**Update File Details**
Update parameters associated with the file as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/update-file-details).
The first argument to the `update_field_details` method is the file ID, and a second argument is an object with the
parameters to be updated.

```ruby
imagekitio.update_file_details(
    file_id: '598821f949c0a938d57563bd',
    tags: ["image_tag"],
    custom_coordinates: "10,10,100, 100"
)
```

**Copy File**

Copy file from one path to another path using the source file path and the destination path as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/copy-file)

```ruby
imagekitio.copy_file(
    source_file_path: '/path/to/file.jpg',
    destination_path: '/folder/to/copy/into',
    include_file_versions: true #default false
)
```

**Move File**

Move file from one folder to another folder using the source file path and destination path as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/move-file)

```ruby
imagekitio.move_file(
    source_file_path: '/path/to/file.jpg',
    destination_path: '/folder/to/move/into/'
)
```

**Rename File**

Rename file as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/rename-file)

```ruby
imagekitio.rename_file(
    file_path: '/path/to/old-file-name.jpg',
    new_file_name: 'new-file-name.jpg',
    purge_cache: true #optional
)
```

**Delete File**

Delete a file as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/delete-file). The method accepts the file ID of the file that has to be deleted.

```ruby
imagekitio.delete_file(
    file_id: '598821f949c0a938d57563bd'
)
```
**File versions**

Get all file versions as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/get-file-versions). The method accepts the file ID of the file.

```ruby
imagekitio.file_versions(
    file_id: '598821f949c0a938d57563bd'
)
```
**File version details**

Get all file version detail as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/get-file-version-details). The method accepts the file ID and version ID of the file.

```ruby
imagekitio.file_version_detail(
    file_id: '598821f949c0a938d57563bd',
    version_id: '846321f949c0a938d57567ty'
)
```

**Delete file version**

Delete file version as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/delete-file-version). The method accepts the file ID and version ID of the file.

```ruby
imagekitio.delete_file_version(
    file_id: '598821f949c0a938d57563bd',
    version_id: '846321f949c0a938d57567ty'
)
```

**Restore file version**

Restore deleted file version as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/restore-file-version). The method accepts the file ID and version ID of the file.

```ruby
imagekitio.restore_file_version(
    file_id: '598821f949c0a938d57563bd',
    version_id: '846321f949c0a938d57567ty'
)
```

**Bulk File Delete by IDs**

Delete a file as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/delete-files-bulk). The method accepts a list of file IDs of files that has to be
deleted.

```ruby
imagekitio.delete_bulk_files(
    file_ids: ["598821f949c0a938d57563bd", "598821f949c0a938d57543bd"]
)
```

**Purge Cache**
Programmatically issue a clear cache request as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/purge-cache).
Accepts the full URL of the file for which the cache has to be cleared.

```ruby
imagekitio.purge_file_cache(
    file_url: 'https://ik.imagekit.io/demo/logo-white_SJwqB4Nfe.png'
)
```
**Purge Cache Status**

Get the purge cache request status using the request ID returned when a purge cache request gets submitted as per the
[API documentation here](https://docs.imagekit.io/api-reference/media-api/purge-cache-status)

```ruby
imagekitio.purge_file_cache_status(
    request_id: '598821f949c0a938d57543bd'
)
```

**Add Bulk Tags**

Add multiple tags on multiple files using an array of file ids and an array of tags as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/add-tags-bulk)

```ruby
imagekitio.add_bulk_tags(
    file_ids: ['598821f949c0a938d57543bd', '598921f949c0a938d57543bd'],
    tags: ['custom_tags', 'image', 'favourite']
)
``` 

**Delete Bulk Tags**

Remove multiple tags from multiple files using an array of file ids and an array of tags as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/remove-tags-bulk)

```ruby
imagekitio.delete_bulk_tags(
    file_ids: ['598821f949c0a938d57543bd', '598921f949c0a938d57543bd'],
    tags: ['custom_tags', 'image']
)
```

**Delete Bulk AI Tags**

Delete bulk ai tags as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/remove-aitags-bulk)

```ruby
imagekitio.delete_bulk_ai_tags(
    file_ids: ['598821f949c0a938d57543bd', '598921f949c0a938d57543bd'],
    ai_tags: ['custom_ai_tags']
)
```

**Create Folder**

Create folder as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/create-folder)

```ruby
imagekitio.create_folder(
    folder_name: 'new_folder',
    parent_folder_path: 'source/folder/path' #optional
)
```


**Copy Folder**

Copy folder as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/copy-folder)

```ruby
imagekitio.copy_folder(
    source_folder_path: '/folder/to/copy',
    destination_path: '/folder/to/copy/into',
    include_file_versions: true #default false
)
```

**Move Folder**

Move folder as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/move-folder)

```ruby
imagekitio.move_folder(
    source_folder_path: '/folder/to/move',
    destination_path: '/folder/to/move/into/'
)
```

**Delete Folder**

Delete folder as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/delete-folder)

```ruby
imagekitio.delete_folder(
    folder_path: 'folder/to/delete'
)
```

**Bulk Job Status**

Get the bulk job status as per the [API documentation here](https://docs.imagekit.io/api-reference/media-api/copy-move-folder-status)

```ruby
imagekitio.bulk_job_status(
    job_id: '5e21880d5efe355febd4cccd'
)
```

**Create a custom metadata field**

Create custom metadata fields as per the [API documentation here](https://docs.imagekit.io/api-reference/custom-metadata-fields-api/create-custom-metadata-field)

```ruby

imagekitio.create_custom_metadata_field(
    name: 'price',
    label: 'price_label',
    schema: {
      'type': 'Number',
      'minValue': 100,
      'maxValue': 300
    }
)
```

**Get Custom Metadata Fields**

Get the custom metadata fields as per the [API documentation here](https://docs.imagekit.io/api-reference/custom-metadata-fields-api/get-custom-metadata-field)

```ruby
imagekitio.get_custom_metadata_fields(
   include_deleted: true #optional
)
```

**Update Custom Metadata Fields**

Update custom metadata fields as per the [API documentation here](https://docs.imagekit.io/api-reference/custom-metadata-fields-api/update-custom-metadata-field)

```ruby
imagekitio.update_custom_metadata_field(
    id: '5e21880d5efe355febd4bccd', #field_id
    label: 'custom-price', #Either label or schema or both should be given
    schema: nil
)
```

**Delete Custom Metadata Fields**

Delete custom metadata fields as per the [API documentation here](https://docs.imagekit.io/api-reference/custom-metadata-fields-api/delete-custom-metadata-field)

```ruby
imagekitio.delete_custom_metadata_field(
    id: '5e21880d5efe355febd4bccd' #field_id
)
```

## Access request-id, other response headers and HTTP status code

Each media management function returns a hash with `response`, `error`, `status_code`, `headers`, `raw_body` keys with respective values.

```ruby
upload = imagekitio.upload_file(
    file: file,
    file_name:  "default.jpg",
    folder: '/test',
    response_fields: 'tags,customCoordinates,isPrivateFile,metadata',
    tags: %w[abc def],
    use_unique_file_name: false,
    is_private_file: true
)
puts upload[:status_code] # 200
puts upload[:headers]

#   {
#        "access-control-allow-origin"=>["*"],
#         "x-ik-requestid"=>["6963194e-014f-8945-b05a-bdb0e088f1bd"],
#         "content-type"=>["application/json; charset=utf-8"],
#         "content-length"=>["611"],
#         "etag"=>["W/\"859-GOeZiRFGOZERjHBgRUhG0EGcODs\""],
#         "date"=>["Wed, 29 Jun 2022 07:04:33 GMT"],
#         "x-request-id"=>["6963194e-014f-8945-b05a-bdb0e088f1bd"],
#         "connection"=>["close"]
#   }


puts upload[:raw_body]
# "{\"fileId\":\"62bjf980rb886bd691b86760\",\"name\":\"default.jpg\",\"size\":102117,\"versionInfo\":{\"id\":\"62bjf980rb886bd691b86760\",\"name\":\"Version 1\"},\"filePath\":\"/test/default.jpg\",\"url\":\"https://ik.imagekit.io/46865sdf6sdf/test/default.jpg\",\"fileType\":\"image\",\"height\":700,\"width\":1050,\"thumbnailUrl\":\"https://ik.imagekit.io/46865sdf6sdf/tr:n-ik_ml_thumbnail/test/default.jpg\",\"tags\":[\"abc\",\"def\"],\"AITags\":null,\"isPrivateFile\":true,\"customCoordinates\":null,\"metadata\":{\"height\":700,\"width\":1050,\"size\":102117,\"format\":\"jpg\",\"hasColorProfile\":true,\"quality\":0,\"density\":72,\"hasTransparency\":false,\"exif\":{},\"pHash\":\"90249d9b1fc74367\"}}"
```

## Utility functions

We have included the following commonly used utility functions in this package.

**Authentication parameter generation**

If you are looking to implement client-side file upload, you will need a `token`, `expiry` timestamp, and a valid `signature` for that upload. The SDK provides a simple method that you can use in your code to generate these authentication parameters for you.

_Note: The Private API Key should never be exposed in any client-side code. You must always generate these authentication parameters on the server-side_

`authentication_parameters = imagekit.get_authentication_parameters(token, expire)`

Returns

```ruby
{
    "token": "unique_token",
    "expire": "valid_expiry_timestamp",
    "signature": "generated_signature"
}
```

Both the `token` and `expire` parameters are optional. If not specified, the SDK uses the uuid to generate a random token and also generates a valid expiry timestamp internally. The value of the `token` and `expire` used to generate the signature is always returned in the response, no matter if they are provided as an input to this method or not.

**Distance calculation between two pHash values**

Perceptual hashing allows you to construct a hash value that uniquely identifies an input image based on the contents
of an image. [imagekit.io metadata API](https://docs.imagekit.io/api-reference/metadata-api) returns the pHash
value of an image in the response. You can use this value to find a duplicate near the duplicate(similar) image by calculating
the distance between the two images.


This SDK exposes the `phash_distance` function to calculate the distance between two pHash values. It accepts two pHash hexadecimal
strings and returns a numeric value indicative of the level of difference between the two images.

```ruby
def calculate_distance():
    # fetch metadata of two uploaded image files
    ...
    # extract pHash strings from both: say 'first_hash' and 'second_hash.'
    ...
    # calculate the distance between them:

    distance = imagekitio.phash_distance(first_hash, second_hash)
    return distance
```

**Distance calculation examples**

```ruby
imagekitio.phash_distance('f06830ca9f1e3e90', 'f06830ca9f1e3e90')
# output: 0 (ame image)

imagekitio.phash_distance('2d5ad3936d2e015b', '2d6ed293db36a4fb')
# output: 17 (similar images)

imagekitio.phash_distance('a4a65595ac94518b', '7838873e791f8400')
# output: 37 (dissimilar images)
```

## Sample Application
There are three sample apps:

* Rails application using Carrierwave
* Rails application using ActiveStorage
* Plain ruby application

Please see the sample applications in [here](https://github.com/imagekit-samples/quickstart).

## Upgrade to 2.x

If you are upgrading to 2.x from version 1.x, make the following changes  in your application:

- Remove config from environment file to initializer file as described [here](#Initialization).
- Include `ImageKitIo::CarrierWave` in uploader class(for Carrierwave).
- Remove `storage :imagekit_store` config from uploader.
- Rename class `ImageKit::ImageKitClient` to `ImageKitIo::Client`
- Rename class `ImageKitIo::ImageKitRequest` to `ImageKitIo::Request`

## Support
For any feedback or to report any issues or general implementation support, please reach out to [support@imagekit.io](mailto:support@imagekit.io)

## Links
-   [Documentation](https://docs.imagekit.io)
-   [Main website](https://imagekit.io)

## License
Released under the MIT license.
