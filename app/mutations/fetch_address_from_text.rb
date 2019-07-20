# frozen_string_literal: true

class FetchAddressFromText < Mutations::Command
  DEFAULT_RESPONSE = { address: { address_fields: {}, coordinates: {} } }
  required { string :text }

  def execute
    result
  end

  private

  def result
    return DEFAULT_RESPONSE if search.nil?
    FetchAddressFromGeocodingAPI.run!(geocoded_result: search)
  end

  def search
    @search ||= Geocoder.search(text)&.first&.data
  end
end
