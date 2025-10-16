#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strong

require_relative "../lib/imagekit"

client = Imagekit::Client.new(
  private_key: ENV.fetch("IMAGEKIT_PRIVATE_KEY", nil)
)

begin
  response = client.files.upload(
    file: "https://www.example.com/public-url.jpg",
    file_name: "file-name.jpg"
  )

  pp(response)
end
