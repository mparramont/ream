class ItemsController < ApplicationController
  def index
    @items = Item.all
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
end
