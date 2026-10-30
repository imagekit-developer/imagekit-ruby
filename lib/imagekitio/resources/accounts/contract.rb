# frozen_string_literal: true

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
        #
        # @overload get(request_options: {})
        #
        # @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Imagekitio::Models::Accounts::ContractGetResponse]
        #
        # @see Imagekitio::Models::Accounts::ContractGetParams
        def get(params = {})
          @client.request(
            method: :get,
            path: "v1/accounts/contract",
            model: Imagekitio::Models::Accounts::ContractGetResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Imagekitio::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
