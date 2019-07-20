# frozen_string_literal: true

class ExtractAddressFromGeocodingAPI < Mutations::Command
  ADDRESS_FIELD_MAPPINGS = {
    'street_number' => :street_number,
    'route' => :stret_name,
    'neighborhood' => :neighborhood,
    'sublocality' => :district,
    'locality' => :municipality,
    'administrative_area_level_3' => :municipality,
    'administrative_area_level_4' => :municipality,
    'postal_code' => :postal_code,
    'country' => :country
  }

  required { duck :geocoded_result }

  def execute
    {
      address: {
        address_fields: address_fields,
        coordinates: coordinates
      }
    }
  end

  private

  def address_fields
    geocoded_result&.dig('address_components').map do |address_field|
      extract_address_field(address_field)
    end&.compact&.to_h
  end

  def extract_address_field(field)
    ADDRESS_FIELD_MAPPINGS.map do |type, result_component|
      [result_component, field['long_name']] if type == field['types'].first
    end.compact
      .first
  end

  def geometry
    @geometry ||= geocoded_result&.dig('geometry')
  end

  def coordinates
    {
      lat: geometry&.dig('location', 'lat'),
      lng: geometry&.dig('location', 'lng'),
    }
  end
end
