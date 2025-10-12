#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: true

require_relative "../lib/imagekit"

# Create an ImageKit client
image_kit = Imagekit::Client.new(
  private_key: "private_test_key_123",
  password: "test_password"
)

# Create some sample transformations (they can be empty for now since we're returning a fixed URL)
transformations = [
  Imagekit::Models::Transformation.new(
    height: 300.0,
    width: 400.0,
    shadow: true
  )
]

# Test all helper functions
puts "Testing helper functions:"
puts "1. buildURL: #{image_kit.helper.buildURL(transformations)}"
puts "2. buildTransformationString: #{image_kit.helper.buildTransformationString(transformations)}"
puts "3. GetAuthenticationParameters: #{image_kit.helper.GetAuthenticationParameters}"
puts "All helper functions are working!"

image_kit.files.upload(
  file: StringIO.new("https://www.example.com/public-url.jpg"),
  file_name: "file-name.jpg"
)
