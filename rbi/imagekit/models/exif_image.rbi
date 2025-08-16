# typed: strong

module Imagekit
  module Models
    class ExifImage < Imagekit::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Imagekit::ExifImage, Imagekit::Internal::AnyHash) }

      sig { returns(T.nilable(Integer)) }
      attr_reader :exif_offset

      sig { params(exif_offset: Integer).void }
      attr_writer :exif_offset

      sig { returns(T.nilable(Integer)) }
      attr_reader :gps_info

      sig { params(gps_info: Integer).void }
      attr_writer :gps_info

      sig { returns(T.nilable(String)) }
      attr_reader :make

      sig { params(make: String).void }
      attr_writer :make

      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      sig { returns(T.nilable(String)) }
      attr_reader :modify_date

      sig { params(modify_date: String).void }
      attr_writer :modify_date

      sig { returns(T.nilable(Integer)) }
      attr_reader :orientation

      sig { params(orientation: Integer).void }
      attr_writer :orientation

      sig { returns(T.nilable(Integer)) }
      attr_reader :resolution_unit

      sig { params(resolution_unit: Integer).void }
      attr_writer :resolution_unit

      sig { returns(T.nilable(String)) }
      attr_reader :software

      sig { params(software: String).void }
      attr_writer :software

      sig { returns(T.nilable(Integer)) }
      attr_reader :x_resolution

      sig { params(x_resolution: Integer).void }
      attr_writer :x_resolution

      sig { returns(T.nilable(Integer)) }
      attr_reader :y_cb_cr_positioning

      sig { params(y_cb_cr_positioning: Integer).void }
      attr_writer :y_cb_cr_positioning

      sig { returns(T.nilable(Integer)) }
      attr_reader :y_resolution

      sig { params(y_resolution: Integer).void }
      attr_writer :y_resolution

      # Object containing EXIF image information.
      sig do
        params(
          exif_offset: Integer,
          gps_info: Integer,
          make: String,
          model: String,
          modify_date: String,
          orientation: Integer,
          resolution_unit: Integer,
          software: String,
          x_resolution: Integer,
          y_cb_cr_positioning: Integer,
          y_resolution: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        exif_offset: nil,
        gps_info: nil,
        make: nil,
        model: nil,
        modify_date: nil,
        orientation: nil,
        resolution_unit: nil,
        software: nil,
        x_resolution: nil,
        y_cb_cr_positioning: nil,
        y_resolution: nil
      )
      end

      sig do
        override.returns(
          {
            exif_offset: Integer,
            gps_info: Integer,
            make: String,
            model: String,
            modify_date: String,
            orientation: Integer,
            resolution_unit: Integer,
            software: String,
            x_resolution: Integer,
            y_cb_cr_positioning: Integer,
            y_resolution: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
