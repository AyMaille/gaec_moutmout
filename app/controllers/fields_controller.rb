class FieldsController < ApplicationController
  def index
    @fields = Field.own_by_user(current_user)
    @field_corners = []
    @fields.each do |field|
      unless CornerPosition.where(field: field).empty?
        i = -1
        @field_corners[i + 1] = []
        @field_corners[i + 1].push(CornerPosition.where(field: field))
      end
    end
  end

  def show
    @sheeps = Sheep.where(field_id: params[:id])
    @field = Field.find(params[:id])
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.create!(field_params)
    Owning.create!(field: @field, user: current_user)
    redirect_to fields_path
  end

  private

  def field_params
    params.require(:field).permit(:field_id, :name)
  end
end
