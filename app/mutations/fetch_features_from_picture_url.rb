require 'dotenv'
Dotenv.load
require 'aws-sdk'
require 'open-uri'

class FetchFeaturesFromPictureUrl < Mutations::Command
  required { string :url }

  def execute
    aws_rekognition_client.detect_labels(image: { bytes: open(url, &:read) })
      .labels
  end

  def aws_rekognition_client
    @aws_rekognition_client ||= Aws::Rekognition::Client.new
  end
end
