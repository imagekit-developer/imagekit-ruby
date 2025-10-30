# frozen_string_literal: true

module Imagekitio
  module Internal
    module Type
      # @api private
      module RequestParameters
        # @!attribute request_options
        # Options to specify HTTP behaviour for this request.
        #
        #   @return [Imagekitio::RequestOptions, Hash{Symbol=>Object}]

        # @param mod [Module]
        def self.included(mod)
          raise ArgumentError.new(mod) unless mod <= Imagekitio::Internal::Type::BaseModel

          mod.optional(:request_options, Imagekitio::RequestOptions)
        end

        # @api private
        module Converter
          # @api private
          #
          # @param params [Object]
          #
          # @return [Array(Object, Hash{Symbol=>Object})]
          def dump_request(params)
            state = {can_retry: true}
            case (dumped = dump(params, state: state))
            in Hash
              options = Imagekitio::Internal::Util.coerce_hash!(dumped[:request_options]).to_h
              request_options = state.fetch(:can_retry) ? options : {**options, max_retries: 0}
              [dumped.except(:request_options), request_options]
            else
              [dumped, nil]
            end
          end
        end
      end
    end
  end
end
