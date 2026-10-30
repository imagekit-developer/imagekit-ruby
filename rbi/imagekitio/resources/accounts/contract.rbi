# typed: strong

module Imagekitio
  module Resources
    class Accounts
      class Contract
        # Get the account's contract terms and the usage consumed against them in the
        # current contract term. Bandwidth is in bytes; video processing units, extension
        # units and purge cache requests are counts.
        #
        # For an agency account, consumption includes the child accounts billed to it. A
        # child account billed to its parent cannot call this endpoint; call it with the
        # parent account's credentials instead.
        #
        # Contract terms are read live; consumption is refreshed periodically, not on
        # every request. Use `asOf` to check how fresh it is. Contracts of one month or
        # less are reported as `hasContract: false`. The response is cached for 5 minutes
        # per account.
        #
        # Requires an API key with account management access.
        sig do
          params(request_options: Imagekitio::RequestOptions::OrHash).returns(
            Imagekitio::Models::Accounts::ContractGetResponse
          )
        end
        def get(request_options: {})
        end

        # @api private
        sig { params(client: Imagekitio::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
