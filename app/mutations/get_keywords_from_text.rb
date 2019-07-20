# frozen_string_literal: true

require('ibm_watson/natural_language_understanding_v1')
require('json')
include IBMWatson

class GetKeywordsFromText < Mutations::Command
  required { string :text }

  def execute
    result
  end

  private

  def result
    response.result
  end

  def response
    ibm_watson_client.analyze(text: text, features: { keywords: {} })
  end

  def ibm_watson_client
    @ibm_watson_client ||=
      IBMWatson::NaturalLanguageUnderstandingV1.new(
        version: '2019-07-12',
        iam_apikey: Rails.application.credentials.ibm[:nlu_api_key],
        url:
          'https://gateway-lon.watsonplatform.net/natural-language-understanding/api'
      )
  end
end
