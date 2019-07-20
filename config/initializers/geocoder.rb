# frozen_string_literal: true

Geocoder.configure(
  units: :km,
  timeout: 5,
  lookup: :google,
  google: {
    api_key: Rails.application.credentials.google[:api_key], use_https: true
  }
)
