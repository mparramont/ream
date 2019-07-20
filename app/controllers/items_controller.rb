class ItemsController < ApplicationController
  def create
    outcome = ProcessItem.run(data: params[:data].permit!.to_h)

    # Then check to see if it worked:
    if outcome.success?
      render json: { item: outcome.result }
    else
      render json: outcome.errors.symbolic, status: 422
    end
  end
end
