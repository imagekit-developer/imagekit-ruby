# typed: strong

module Imagekitio
  module Models
    class AIFilterSearchCreateParams < Imagekitio::Internal::Type::BaseModel
      extend Imagekitio::Internal::Type::RequestParameters::Converter
      include Imagekitio::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Imagekitio::AIFilterSearchCreateParams,
            Imagekitio::Internal::AnyHash
          )
        end

      # Natural-language description of what to search for, e.g. "red dresses tagged
      # summer uploaded last month".
      sig { returns(String) }
      attr_accessor :prompt

      # Absolute path of the folder the user is currently in. Used to resolve relative
      # references like "this folder" in the prompt.
      sig { returns(T.nilable(String)) }
      attr_reader :current_folder

      sig { params(current_folder: String).void }
      attr_writer :current_folder

      # IANA timezone (e.g. `Asia/Kolkata`) used to resolve relative date references in
      # the prompt. Defaults to UTC when omitted.
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      sig do
        params(
          prompt: String,
          current_folder: String,
          timezone: String,
          request_options: Imagekitio::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Natural-language description of what to search for, e.g. "red dresses tagged
        # summer uploaded last month".
        prompt:,
        # Absolute path of the folder the user is currently in. Used to resolve relative
        # references like "this folder" in the prompt.
        current_folder: nil,
        # IANA timezone (e.g. `Asia/Kolkata`) used to resolve relative date references in
        # the prompt. Defaults to UTC when omitted.
        timezone: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            prompt: String,
            current_folder: String,
            timezone: String,
            request_options: Imagekitio::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
