require 'uri'
require 'net/http'
require 'base64'
module CarrierWave
    module Storage
        class ImageKitStore < Abstract

          def initialize(*)
              super
              @cache_called = nil
          end
          
          def store!(file)
            file.delete
          end

          def retrieve!(identifier)
            
            IKFile.new(identifier)
          end

          def cache!(new_file)
            new_file.move_to(::File.expand_path(uploader.cache_path, uploader.root), uploader.permissions, uploader.directory_permissions, true)
            rescue Errno::EMLINK, Errno::ENOSPC => e
              raise(e) if @cache_called
              @cache_called = true
      
              # NOTE: Remove cached files older than 10 minutes
              clean_cache!(600)
      
              cache!(new_file)
          end

          def retrieve_from_cache!(identifier)
              CarrierWave::SanitizedFile.new(::File.expand_path(uploader.cache_path(identifier), uploader.root))
          end

          def delete_dir!(path)
              if path
                begin
                  Dir.rmdir(::File.expand_path(path, uploader.root))
                rescue Errno::ENOENT
                  # Ignore: path does not exist
                rescue Errno::ENOTDIR
                  # Ignore: path is not a dir
                rescue Errno::ENOTEMPTY, Errno::EEXIST
                  # Ignore: dir is not empty
                end
              end
          end

          def clean_cache!(seconds)
              Dir.glob(::File.expand_path(::File.join(uploader.cache_dir, '*'), CarrierWave.root)).each do |dir|
                # generate_cache_id returns key formated TIMEINT-PID(-COUNTER)-RND
                time = dir.scan(/(\d+)-\d+-\d+(?:-\d+)?/).first.map(&:to_i)
                time = Time.at(*time)
                if time < (Time.now.utc - seconds)
                  FileUtils.rm_rf(dir)
                end
              end
          end
            
        end
    end
end