class SheepsController < ApplicationController
  def index
    fields = Field.all
    @sheeps = []
    fields.each do |field|
      field.ownings.each do |owning|
        if owning.user == current_user
          Sheep.where(field_id: field.id).each { |owner_field| @sheeps << owner_field }
        end
      end
    end
  end

  def show
    @sheep = Sheep.find(params[:format])
  end
end
