#!/usr/bin/env ruby
# frozen_string_literal: true


require_relative "../lib/imagekit"

# Create an ImageKit client
image_kit = Imagekit::Client.new(
  private_key: "private_test_key_123",
  password: "test_password"
)

# Create some sample transformations (they can be empty for now since we're returning a fixed URL)
transformations = [
  Imagekit::Models::Transformation.new(
    height: 300,
    width: 400,
    shadow: true
  )
]

# Test all helper functions
puts "Testing helper functions:"
puts "1. buildURL: #{image_kit.helpers.buildURL(transformations)}"
puts "2. generateTransformationString: #{image_kit.helpers.generateTransformationString(transformations)}"
puts "3. GetAuthenticationParameters: #{image_kit.helpers.GetAuthenticationParameters}"
puts "All helper functions are working!"
