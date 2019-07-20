# Define a command that signs up a user.
class ProcessItem < Mutations::Command
  required { duck :input_data }

  def execute
    output_data =
      process_hash(input_data) do |value|
        if value =~ /^http/
          FetchFeaturesFromPictureUrl.run!(url: value)
        elsif value =~ /.{10,}/
          FetchKeywordsFromText.run!(text: value)
        end
      end

    Item.create!(input_data: input_data, output_data: output_data)
  end

  def process_hash(hash, &block)
    hash.each_with_object({}) do |(key, value), object|
      object[key] = process_item(value, block)
    end
  end

  def process_item(value, block)
    if value.is_a?(Hash) ||
       value.is_a?(ActiveSupport::HashWithIndifferentAccess)
      process_hash(value, &block)
    elsif value.is_a?(Array)
      value.map { |i| process_item(i, block) }
    else
      { input: value, info: block.call(value) }
    end
  end
end
