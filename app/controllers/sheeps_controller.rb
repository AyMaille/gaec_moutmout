class SheepsController < ApplicationController
  def index
    fields = Field.all
    fields.each do |field|
      @sheeps = Sheep.where(field_id: field.id) if field.owning.user == current_user
    end
  end

  def show
    @sheep = Sheep.find(params[:format])
  end
end
