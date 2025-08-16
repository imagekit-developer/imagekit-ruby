# typed: strong

module Imagekit
  module Models
    class Thumbnail < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekit::Thumbnail, Imagekit::Internal::AnyHash) }

      sig { returns(T.nilable(Integer)) }
      attr_reader :compression

      sig { params(compression: Integer).void }
      attr_writer :compression

      sig { returns(T.nilable(Integer)) }
      attr_reader :resolution_unit

      sig { params(resolution_unit: Integer).void }
      attr_writer :resolution_unit

      sig { returns(T.nilable(Integer)) }
      attr_reader :thumbnail_length

      sig { params(thumbnail_length: Integer).void }
      attr_writer :thumbnail_length

      sig { returns(T.nilable(Integer)) }
      attr_reader :thumbnail_offset

      sig { params(thumbnail_offset: Integer).void }
      attr_writer :thumbnail_offset

      sig { returns(T.nilable(Integer)) }
      attr_reader :x_resolution

      sig { params(x_resolution: Integer).void }
      attr_writer :x_resolution

      sig { returns(T.nilable(Integer)) }
      attr_reader :y_resolution

      sig { params(y_resolution: Integer).void }
      attr_writer :y_resolution

      # Object containing Thumbnail information.
      sig do
        params(
          compression: Integer,
          resolution_unit: Integer,
          thumbnail_length: Integer,
          thumbnail_offset: Integer,
          x_resolution: Integer,
          y_resolution: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        compression: nil,
        resolution_unit: nil,
        thumbnail_length: nil,
        thumbnail_offset: nil,
        x_resolution: nil,
        y_resolution: nil
      )
      end

      sig do
        override.returns(
          {
            compression: Integer,
            resolution_unit: Integer,
            thumbnail_length: Integer,
            thumbnail_offset: Integer,
            x_resolution: Integer,
            y_resolution: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
