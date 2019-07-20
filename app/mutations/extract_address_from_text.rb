# frozen_string_literal: true

class ExtractAddressFromText < Mutations::Command
  required { string :address }

  def execute
    result
  end

  private

  def result
    ExtractAddressFromGeocodingAPI.run!(geocoded_result: search)
  end

  def search
    @search ||= Geocoder.search(address)&.first&.data
  end
end
