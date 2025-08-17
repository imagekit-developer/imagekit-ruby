# frozen_string_literal: true

module Imagekit
  module Models
    class Gps < Imagekit::Internal::Type::BaseModel
      # @!attribute gps_version_id
      #
      #   @return [Array<Integer>, nil]
      optional :gps_version_id, Imagekit::Internal::Type::ArrayOf[Integer], api_name: :GPSVersionID

      # @!method initialize(gps_version_id: nil)
      #   Object containing GPS information.
      #
      #   @param gps_version_id [Array<Integer>]
    end
  end
end
