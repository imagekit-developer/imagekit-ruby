# Image Kit Ruby API library

The Image Kit Ruby library provides convenient access to the Image Kit REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/imagekit-developer/imagekit-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

## Table of Contents

- [Documentation](#documentation)
- [Installation](#installation)
- [Usage](#usage)
  - [File uploads](#file-uploads)
- [URL Generation](#url-generation)
  - [Basic URL generation](#basic-url-generation)
  - [URL generation with transformations](#url-generation-with-transformations)
  - [URL generation with image overlay](#url-generation-with-image-overlay)
  - [URL generation with text overlay](#url-generation-with-text-overlay)
  - [Signed URLs for secure delivery](#signed-urls-for-secure-delivery)
  - [Chained transformations](#chained-transformations)
  - [Using raw parameter for custom transformations](#using-raw-parameter-for-custom-transformations)
- [Helper Methods](#helper-methods)
  - [Authentication parameters for client-side uploads](#authentication-parameters-for-client-side-uploads)
  - [Responsive image attributes](#responsive-image-attributes)
- [Handling errors](#handling-errors)
  - [Retries](#retries)
  - [Timeouts](#timeouts)
- [Advanced concepts](#advanced-concepts)
  - [BaseModel](#basemodel)
  - [Making custom or undocumented requests](#making-custom-or-undocumented-requests)
  - [Concurrency & connection pooling](#concurrency--connection-pooling)
- [Sorbet](#sorbet)
  - [Enums](#enums)
- [Versioning](#versioning)
- [Requirements](#requirements)
- [Contributing](#contributing)

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/imagekit).

The REST API documentation can be found on [imagekit.io](https://imagekit.io/docs/api-reference).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "imagekit", "~> 0.0.1"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "imagekit"

image_kit = Imagekit::Client.new(
  private_key: ENV["IMAGEKIT_PRIVATE_KEY"] # This is the default and can be omitted
)

response = image_kit.files.upload(
  file: Pathname("/path/to/file"),
  file_name: "file-name.jpg"
)

puts(response.file_id)
```

### File uploads

Request parameters that correspond to file uploads can be passed as raw contents, a [`Pathname`](https://rubyapi.org/3.2/o/pathname) instance, or an `IO` stream.

```ruby
require "pathname"

# Use `Pathname` to stream from disk (memory efficient, supports retries):
response = image_kit.files.upload(file: Pathname("/path/to/file"))

# Or pass file contents directly
response = image_kit.files.upload(file: File.read("/path/to/file"))

# Or control filename and content type with FilePart:
file = Imagekit::FilePart.new(File.read("/path/to/file"), filename: "custom.jpg", content_type: "image/jpeg")
response = image_kit.files.upload(file: file)

puts(response.file_id)
```

Note that you can also pass a raw `IO` descriptor, but this disables retries, as the library can't be sure if the descriptor is a file or pipe (which cannot be rewound).

## URL Generation

The ImageKit SDK provides a powerful `helper.build_url()` method for generating optimized image and video URLs with transformations. Here are examples ranging from simple URLs to complex transformations with overlays and signed URLs.

### Basic URL generation

Generate a simple URL without any transformations:

```ruby
require "imagekit"

image_kit = Imagekit::Client.new(
  private_key: ENV["IMAGEKIT_PRIVATE_KEY"]
)

# Basic URL without transformations
url = image_kit.helper.build_url({
  src: "/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id"
})

puts url
# Output: https://ik.imagekit.io/your_imagekit_id/default-image.jpg
```

You can also use absolute URLs:

```ruby
url = image_kit.helper.build_url({
  src: "https://ik.imagekit.io/your_imagekit_id/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id"
})
```

### URL generation with transformations

Apply common transformations like resizing, cropping, and format conversion:

```ruby
# URL with basic transformations
url = image_kit.helper.build_url({
  src: "/path/to/image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 400,
      height: 300,
      crop: :maintain_ratio,
      quality: 80,
      format_: :webp
    }
  ]
})
# Output: https://ik.imagekit.io/your_imagekit_id/path/to/image.jpg?tr=w-400,h-300,c-maintain_ratio,q-80,f-webp
```

More transformation examples:

```ruby
# Image resizing and cropping
url = image_kit.helper.build_url({
  src: "/product.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 800,
      height: 600,
      crop: :at_max,
      focus: "auto"
    }
  ]
})

# Image effects
url = image_kit.helper.build_url({
  src: "/photo.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      blur: 10,
      grayscale: true,
      radius: 20
    }
  ]
})

# Format and quality optimization
url = image_kit.helper.build_url({
  src: "/image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      format_: :auto,
      quality: 85,
      progressive: true
    }
  ]
})
```

### URL generation with image overlay

Add image overlays to your base image:

```ruby
# URL with image overlay
url = image_kit.helper.build_url({
  src: "/path/to/base-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 500,
      height: 400,
      overlay: {
        type: :image,
        input: "/path/to/overlay-logo.png",
        position: {
          x: 10,
          y_: 10
        },
        transformation: [
          {
            width: 100,
            height: 50
          }
        ]
      }
    }
  ]
})
# Output: URL with image overlay positioned at x:10, y:10
```

### URL generation with text overlay

Add customized text overlays:

```ruby
# URL with text overlay
url = image_kit.helper.build_url({
  src: "/path/to/base-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 600,
      height: 400,
      overlay: {
        type: :text,
        text: "Sample Text Overlay",
        position: {
          x: 50,
          y_: 50,
          focus: :center
        },
        transformation: [
          {
            font_size: 40,
            font_family: "Arial",
            font_color: "FFFFFF",
            typography: "b"  # bold
          }
        ]
      }
    }
  ]
})
# Output: URL with bold white Arial text overlay at center position
```

You can combine multiple overlays for complex compositions:

```ruby
# URL with multiple overlays (text + image)
url = image_kit.helper.build_url({
  src: "/path/to/base-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 800,
      height: 600,
      overlay: {
        type: :text,
        text: "Header Text",
        position: { x: 20, y_: 20 },
        transformation: [{ font_size: 30, font_color: "000000" }]
      }
    },
    {
      overlay: {
        type: :image,
        input: "/watermark.png",
        position: { focus: :bottom_right },
        transformation: [{ width: 100, opacity: 70 }]
      }
    }
  ]
})
# Output: URL with text overlay at top-left and semi-transparent watermark at bottom-right
```

### Signed URLs for secure delivery

Generate signed URLs that expire after a specified time for secure content delivery:

```ruby
# Generate a signed URL that expires in 1 hour (3600 seconds)
url = image_kit.helper.build_url({
  src: "/private/secure-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 400,
      height: 300,
      quality: 90
    }
  ],
  signed: true,
  expires_in: 3600  # URL expires in 1 hour
})
# Output: URL with signature parameters (?ik-t=timestamp&ik-s=signature)

# Generate a signed URL that doesn't expire
url = image_kit.helper.build_url({
  src: "/private/secure-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  signed: true
  # No expires_in means the URL won't expire
})
# Output: URL with signature parameter (?ik-s=signature)
```

### Chained transformations

Apply multiple transformation steps by passing multiple transformation objects. Each transformation is applied sequentially:

```ruby
# First resize, then apply effects
url = image_kit.helper.build_url({
  src: "/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 400,
      height: 300
    },
    {
      rotation: 90,
      blur: 5
    }
  ]
})
# Output: https://ik.imagekit.io/your_imagekit_id/default-image.jpg?tr=w-400,h-300:rt-90,bl-5
```

### Using raw parameter for custom transformations

ImageKit frequently adds new transformation parameters that might not yet be documented in the SDK. You can use the `raw` parameter to access these features or create custom transformation strings:

```ruby
# Using raw parameter for custom transformations
url = image_kit.helper.build_url({
  src: "/path/to/image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation: [
    {
      width: 400,
      height: 300,
      raw: "something-new"
    }
  ]
})
# Output: https://ik.imagekit.io/your_imagekit_id/path/to/image.jpg?tr=w-400,h-300,something-new
```

You can control where transformations appear in the URL:

```ruby
# Add transformations to the URL path instead of query parameters
url = image_kit.helper.build_url({
  src: "/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  transformation_position: :path,
  transformation: [
    {
      width: 400,
      height: 300
    }
  ]
})
# Output: https://ik.imagekit.io/your_imagekit_id/tr:w-400,h-300/default-image.jpg
```

Add custom query parameters:

```ruby
url = image_kit.helper.build_url({
  src: "/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  query_parameters: {
    version: "1",
    cache: "max"
  }
})
```

## Helper Methods

The SDK provides several helper methods for common ImageKit operations.

### Authentication parameters for client-side uploads

Generate authentication parameters for secure client-side file uploads. These parameters allow you to securely upload files directly from the browser without exposing your private API key:

```ruby
require "imagekit"

image_kit = Imagekit::Client.new(
  private_key: ENV["IMAGEKIT_PRIVATE_KEY"]
)

# Generate authentication parameters with default expiry (30 minutes)
auth_params = image_kit.helper.get_authentication_parameters

puts auth_params
# Output: { token: "unique-token", expire: 1234567890, signature: "signature-hash" }
```

Customize the token and expiration:

```ruby
# Custom token and expiry (1 hour from now)
auth_params = image_kit.helper.get_authentication_parameters(
  token: "my-custom-token",
  expire: Time.now.to_i + 3600
)
# Output: { token: "my-custom-token", expire: 1234567890, signature: "generated-signature" }
```

These authentication parameters can be used in client-side upload forms to securely upload files without exposing your private API key.

### Responsive image attributes

Generate responsive image attributes for HTML `<img>` tags. This creates optimized `srcset` and `sizes` attributes for responsive images:

```ruby
# Width-based responsive images (generates w descriptors)
attrs = image_kit.helper.get_responsive_image_attributes({
  src: "/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  sizes: "(min-width: 768px) 50vw, 100vw",
  transformation: [
    {
      quality: 80,
      format_: :auto
    }
  ]
})

puts attrs.src
# Largest candidate URL

puts attrs.src_set
# URL1 640w, URL2 750w, URL3 1080w, ...

puts attrs.sizes
# (min-width: 768px) 50vw, 100vw
```

DPR-based responsive images (generates x descriptors):

```ruby
# When width is provided without sizes, generates 1x and 2x variants
attrs = image_kit.helper.get_responsive_image_attributes({
  src: "/profile.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  width: 400,
  transformation: [
    {
      quality: 85
    }
  ]
})

puts attrs.src_set
# URL1 1x, URL2 2x

puts attrs.width
# 400
```

Custom breakpoints for device widths:

```ruby
attrs = image_kit.helper.get_responsive_image_attributes({
  src: "/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  sizes: "100vw",
  device_breakpoints: [320, 640, 1024, 1920],
  image_breakpoints: [16, 32, 64],
  transformation: [
    {
      crop: :at_max
    }
  ]
})
```

The returned attributes can be directly used in your HTML:

```erb
<img
  src="<%= attrs.src %>"
  srcset="<%= attrs.src_set %>"
  sizes="<%= attrs.sizes %>"
  alt="Responsive image"
/>
```

Generate signed responsive image URLs:

```ruby
# Generate signed responsive image URLs
attrs = image_kit.helper.get_responsive_image_attributes({
  src: "/default-image.jpg",
  url_endpoint: "https://ik.imagekit.io/your_imagekit_id",
  sizes: "100vw",
  signed: true,
  expires_in: 3600,
  transformation: [
    {
      quality: 80
    }
  ]
})
```

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `Imagekit::Errors::APIError` will be thrown:

```ruby
begin
  file = image_kit.files.upload(
    file: File.read("/path/to/file.jpg"),
    file_name: "file-name.jpg"
  )
rescue Imagekit::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue Imagekit::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue Imagekit::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
image_kit = Imagekit::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
image_kit.files.upload(
  file: File.read("/path/to/file.jpg"),
  file_name: "file-name.jpg",
  request_options: {max_retries: 5}
)
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
image_kit = Imagekit::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
image_kit.files.upload(
  file: File.read("/path/to/file.jpg"),
  file_name: "file-name.jpg",
  request_options: {timeout: 5}
)
```

On timeout, `Imagekit::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `Imagekit::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
response =
  image_kit.files.upload(
    file: File.read("/path/to/file.jpg"),
    file_name: "file-name.jpg",
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(response[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `Imagekit::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `Imagekit::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
image_kit.files.upload(
  file: File.read("/path/to/file.jpg"),
  file_name: "file-name.jpg"
)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
image_kit.files.upload(
  file: File.read("/path/to/file.jpg"),
  file_name: "file-name.jpg"
)

# You can also splat a full Params class:
params = Imagekit::FileUploadParams.new(
  file: File.read("/path/to/file.jpg"),
  file_name: "file-name.jpg"
)
image_kit.files.upload(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :all
puts(Imagekit::AssetListParams::FileType::ALL)

# Revealed type: `T.all(Imagekit::AssetListParams::FileType, Symbol)`
T.reveal_type(Imagekit::AssetListParams::FileType::ALL)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
image_kit.assets.list(
  file_type: Imagekit::AssetListParams::FileType::ALL,
  # …
)

# Literal values are also permissible:
image_kit.assets.list(
  file_type: :all,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/imagekit-developer/imagekit-ruby/tree/master/CONTRIBUTING.md).
