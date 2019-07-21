class ItemsController < ApplicationController
  def index
    @items = Item.all
    if @items.present?
      @chart_data = [
        number_of_keys(@items.first.input_data).size,
        number_of_keys(@items.first.output_data).size
      ]
    end
  end

  def create
    outcome = ProcessItem.run(input_data: params[:data].permit!.to_h)

    # Then check to see if it worked:
    if outcome.success?
      render json: { item: outcome.result }
    else
      render json: outcome.errors.symbolic, status: 422
    end
  end

  def number_of_keys(hash)
    hash.each_with_object([]) do |(key, value), keys|
      keys << key
      keys.concat(number_of_keys(value)) if value.is_a? Hash
    end
  end
end
