class FieldsController < ApplicationController
  def index
    @fields = Field.own_by_user(current_user)
  end

  def show
    @sheeps = Sheep.where(field_id: params[:id])
    @field = Field.find(params[:id])
  end

  # private

  # def field_params
  #   params.require(:field).permit(:field_id)
  # end
end
