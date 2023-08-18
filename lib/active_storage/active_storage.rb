begin
    require 'active_storage'
  rescue LoadError
    puts "Add gem 'activestorage' to use this service"
  end
  require_relative './service/ik_file'
  require_relative './service/image_kit_io_service'
