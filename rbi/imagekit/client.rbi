# typed: strong

module Imagekit
  class Client < Imagekit::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # Your ImageKit private key starts with `private_`.
    sig { returns(String) }
    attr_reader :private_api_key

    # Do not set this, its value is ignored
    sig { returns(T.nilable(String)) }
    attr_reader :password

    sig { returns(Imagekit::Resources::CustomMetadataFields) }
    attr_reader :custom_metadata_fields

    sig { returns(Imagekit::Resources::Files) }
    attr_reader :files

    sig { returns(Imagekit::Resources::Folder) }
    attr_reader :folder

    sig { returns(Imagekit::Resources::BulkJobs) }
    attr_reader :bulk_jobs

    sig { returns(Imagekit::Resources::Accounts) }
    attr_reader :accounts

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # @api private
    sig { returns(T::Boolean) }
    def base_url_overridden?
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        private_api_key: T.nilable(String),
        password: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Your ImageKit private key starts with `private_`. Defaults to
      # `ENV["IMAGEKIT_PRIVATE_API_KEY"]`
      private_api_key: ENV["IMAGEKIT_PRIVATE_API_KEY"],
      # Do not set this, its value is ignored Defaults to `ENV["ORG_MY_PASSWORD_TOKEN"]`
      password: ENV.fetch("ORG_MY_PASSWORD_TOKEN", "does_not_matter"),
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["IMAGE_KIT_BASE_URL"]`
      base_url: ENV["IMAGE_KIT_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Imagekit::Client::DEFAULT_MAX_RETRIES,
      timeout: Imagekit::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Imagekit::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Imagekit::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
