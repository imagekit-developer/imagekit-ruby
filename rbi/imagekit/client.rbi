# typed: strong

module Imagekit
  class Client < Imagekit::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # Your ImageKit private API key (it starts with `private_`). You can view and
    # manage API keys in the
    # [dashboard](https://imagekit.io/dashboard/developer/api-keys).
    sig { returns(String) }
    attr_reader :private_key

    # ImageKit Basic Auth only uses the `private_key` as username and ignores the
    # password.
    sig { returns(T.nilable(String)) }
    attr_reader :password

    sig { returns(Imagekit::Resources::CustomMetadataFields) }
    attr_reader :custom_metadata_fields

    sig { returns(Imagekit::Resources::Files) }
    attr_reader :files

    sig { returns(Imagekit::Resources::Assets) }
    attr_reader :assets

    sig { returns(Imagekit::Resources::Cache) }
    attr_reader :cache

    sig { returns(Imagekit::Resources::Folders) }
    attr_reader :folders

    sig { returns(Imagekit::Resources::Accounts) }
    attr_reader :accounts

    sig { returns(Imagekit::Resources::Beta) }
    attr_reader :beta

    sig { returns(Imagekit::Resources::Webhooks) }
    attr_reader :webhooks

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
        private_key: T.nilable(String),
        password: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Your ImageKit private API key (it starts with `private_`). You can view and
      # manage API keys in the
      # [dashboard](https://imagekit.io/dashboard/developer/api-keys). Defaults to
      # `ENV["IMAGEKIT_PRIVATE_API_KEY"]`
      private_key: ENV["IMAGEKIT_PRIVATE_API_KEY"],
      # ImageKit Basic Auth only uses the `private_key` as username and ignores the
      # password. Defaults to `ENV["OPTIONAL_IMAGEKIT_IGNORES_THIS"]`
      password: ENV.fetch("OPTIONAL_IMAGEKIT_IGNORES_THIS", "do_not_set"),
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
