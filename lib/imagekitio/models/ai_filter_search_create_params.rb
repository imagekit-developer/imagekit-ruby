# frozen_string_literal: true

module Imagekitio
  module Models
    # @see Imagekitio::Resources::AIFilterSearch#create
    class AIFilterSearchCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      # @!attribute prompt
      #   Natural-language description of what to search for, e.g. "red dresses tagged
      #   summer uploaded last month".
      #
      #   @return [String]
      required :prompt, String

      # @!attribute current_folder
      #   Absolute path of the folder the user is currently in. Used to resolve relative
      #   references like "this folder" in the prompt.
      #
      #   @return [String, nil]
      optional :current_folder, String, api_name: :currentFolder

      # @!attribute timezone
      #   IANA timezone (e.g. `Asia/Kolkata`) used to resolve relative date references in
      #   the prompt. Defaults to UTC when omitted.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(prompt:, current_folder: nil, timezone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Imagekitio::Models::AIFilterSearchCreateParams} for more details.
      #
      #   @param prompt [String] Natural-language description of what to search for, e.g. "red dresses tagged sum
      #
      #   @param current_folder [String] Absolute path of the folder the user is currently in. Used to resolve relative r
      #
      #   @param timezone [String] IANA timezone (e.g. `Asia/Kolkata`) used to resolve relative date references in
      #
      #   @param request_options [Imagekitio::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
