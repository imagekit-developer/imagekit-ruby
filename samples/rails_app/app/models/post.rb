class Post < ApplicationRecord
    attr_accessor :picture
    mount_uploader :picture, ImageUploader
end
