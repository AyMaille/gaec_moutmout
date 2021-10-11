class FieldsController < ApplicationController

  def show
    @sheeps = Sheep.where(field_id: params[:id])
    @field = Field.find(params[:id])
  end

  # private

  # def field_params
  #   params.require(:field).permit(:field_id)
  # end
end
