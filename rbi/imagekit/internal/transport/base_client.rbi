# typed: strong

module Imagekit
  module Internal
    module Transport
      # @api private
      class BaseClient
        extend Imagekit::Internal::Util::SorbetRuntimeSupport

        abstract!

        RequestComponents =
          T.type_alias do
            {
              method: Symbol,
              path: T.any(String, T::Array[String]),
              query:
                T.nilable(
                  T::Hash[String, T.nilable(T.any(T::Array[String], String))]
                ),
              headers:
                T.nilable(
                  T::Hash[
                    String,
                    T.nilable(
                      T.any(
                        String,
                        Integer,
                        T::Array[T.nilable(T.any(String, Integer))]
                      )
                    )
                  ]
                ),
              body: T.nilable(T.anything),
              unwrap:
                T.nilable(
                  T.any(
                    Symbol,
                    Integer,
                    T::Array[T.any(Symbol, Integer)],
                    T.proc.params(arg0: T.anything).returns(T.anything)
                  )
                ),
              page:
                T.nilable(
                  T::Class[
                    Imagekit::Internal::Type::BasePage[
                      Imagekit::Internal::Type::BaseModel
                    ]
                  ]
                ),
              stream: T.nilable(T::Class[T.anything]),
              model: T.nilable(Imagekit::Internal::Type::Converter::Input),
              options: T.nilable(Imagekit::RequestOptions::OrHash)
            }
          end

        RequestInput =
          T.type_alias do
            {
              method: Symbol,
              url: URI::Generic,
              headers: T::Hash[String, String],
              body: T.anything,
              max_retries: Integer,
              timeout: Float
            }
          end

        # from whatwg fetch spec
        MAX_REDIRECTS = 20

        PLATFORM_HEADERS = T::Hash[String, String]

        class << self
          # @api private
          sig do
            params(
              req: Imagekit::Internal::Transport::BaseClient::RequestComponents
            ).void
          end
          def validate!(req)
          end

          # @api private
          sig do
            params(
              status: Integer,
              headers: T.any(T::Hash[String, String], Net::HTTPHeader)
            ).returns(T::Boolean)
          end
          def should_retry?(status, headers:)
          end

          # @api private
          sig do
            params(
              request: Imagekit::Internal::Transport::BaseClient::RequestInput,
              status: Integer,
              response_headers: T.any(T::Hash[String, String], Net::HTTPHeader)
            ).returns(Imagekit::Internal::Transport::BaseClient::RequestInput)
          end
          def follow_redirect(request, status:, response_headers:)
          end

          # @api private
          sig do
            params(
              status: T.any(Integer, Imagekit::Errors::APIConnectionError),
              stream: T.nilable(T::Enumerable[String])
            ).void
          end
          def reap_connection!(status, stream:)
          end
        end

        sig { returns(URI::Generic) }
        attr_reader :base_url

        sig { returns(Float) }
        attr_reader :timeout

        sig { returns(Integer) }
        attr_reader :max_retries

        sig { returns(Float) }
        attr_reader :initial_retry_delay

        sig { returns(Float) }
        attr_reader :max_retry_delay

        sig { returns(T::Hash[String, String]) }
        attr_reader :headers

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_header

        # @api private
        sig { returns(Imagekit::Internal::Transport::PooledNetRequester) }
        attr_reader :requester

        # @api private
        sig do
          params(
            base_url: String,
            timeout: Float,
            max_retries: Integer,
            initial_retry_delay: Float,
            max_retry_delay: Float,
            headers:
              T::Hash[
                String,
                T.nilable(
                  T.any(
                    String,
                    Integer,
                    T::Array[T.nilable(T.any(String, Integer))]
                  )
                )
              ],
            idempotency_header: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          base_url:,
          timeout: 0.0,
          max_retries: 0,
          initial_retry_delay: 0.0,
          max_retry_delay: 0.0,
          headers: {},
          idempotency_header: nil
        )
        end

        # @api private
        sig { overridable.returns(T::Hash[String, String]) }
        private def auth_headers
        end

        # @api private
        sig { returns(String) }
        private def generate_idempotency_key
        end

        # @api private
        sig do
          overridable
            .params(
              req: Imagekit::Internal::Transport::BaseClient::RequestComponents,
              opts: Imagekit::Internal::AnyHash
            )
            .returns(Imagekit::Internal::Transport::BaseClient::RequestInput)
        end
        private def build_request(req, opts)
        end

        # @api private
        sig do
          params(
            headers: T::Hash[String, String],
            retry_count: Integer
          ).returns(Float)
        end
        private def retry_delay(headers, retry_count:)
        end

        # @api private
        sig do
          params(
            request: Imagekit::Internal::Transport::BaseClient::RequestInput,
            redirect_count: Integer,
            retry_count: Integer,
            send_retry_header: T::Boolean
          ).returns([Integer, Net::HTTPResponse, T::Enumerable[String]])
        end
        def send_request(
          request,
          redirect_count:,
          retry_count:,
          send_retry_header:
        )
        end

        # Execute the request specified by `req`. This is the method that all resource
        # methods call into.
        #
        # @overload request(method, path, query: {}, headers: {}, body: nil, unwrap: nil, page: nil, stream: nil, model: Imagekit::Internal::Type::Unknown, options: {})
        sig do
          params(
            method: Symbol,
            path: T.any(String, T::Array[String]),
            query:
              T.nilable(
                T::Hash[String, T.nilable(T.any(T::Array[String], String))]
              ),
            headers:
              T.nilable(
                T::Hash[
                  String,
                  T.nilable(
                    T.any(
                      String,
                      Integer,
                      T::Array[T.nilable(T.any(String, Integer))]
                    )
                  )
                ]
              ),
            body: T.nilable(T.anything),
            unwrap:
              T.nilable(
                T.any(
                  Symbol,
                  Integer,
                  T::Array[T.any(Symbol, Integer)],
                  T.proc.params(arg0: T.anything).returns(T.anything)
                )
              ),
            page:
              T.nilable(
                T::Class[
                  Imagekit::Internal::Type::BasePage[
                    Imagekit::Internal::Type::BaseModel
                  ]
                ]
              ),
            stream: T.nilable(T::Class[T.anything]),
            model: T.nilable(Imagekit::Internal::Type::Converter::Input),
            options: T.nilable(Imagekit::RequestOptions::OrHash)
          ).returns(T.anything)
        end
        def request(
          method,
          path,
          query: {},
          headers: {},
          body: nil,
          unwrap: nil,
          page: nil,
          stream: nil,
          model: Imagekit::Internal::Type::Unknown,
          options: {}
        )
        end

        # @api private
        sig { returns(String) }
        def inspect
        end
      end
    end
  end
end
