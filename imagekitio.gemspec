$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "imagekit/sdk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "imagekitio"
  spec.version     = Imagekit::Sdk::VERSION
  spec.authors     = ["ImageKit.io team"]
  spec.email       = ["developer@imagekit.io"]
  spec.homepage    = "https://imagekit.io"
  spec.summary     = "Automate image optimization on rails platforms."
  spec.description = "Automate image optimization on rails platforms."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

#  spec.add_dependency "rails", "~> 5.2.0", ">= 5.2.0"
  spec.add_dependency 'carrierwave', '>= 0.7', '< 2.2'
  spec.add_dependency 'rest-client', '~> 2.1', ">=2.1"
  spec.add_dependency 'addressable', '~> 2.8'

  # spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rails", "~> 5.2.0", ">= 5.2.0"
end
