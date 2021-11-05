class CornerPositionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @corner_position = CornerPosition.create(corner_position_params)
  end

  private

  def corner_position_params
    params.require(:corner_position).permit(:field_id, :lat, :long)
  end
end
