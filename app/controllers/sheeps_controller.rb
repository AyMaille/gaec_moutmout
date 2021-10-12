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

  def new
    @sheep = Sheep.new
    @sheeps = Sheep.where(field_id: params[:field_id])
    @sheeps = @sheeps.select { |sheep| sheep.kind == "brebis" }
  end

  def create
    @sheep = Sheep.new(params[sheep_params])
    @sheep.kind = "jeune"
    @sheep.age = 0
    @sheep.pregnant = false
    @sheep.expected_lambs = 0
  end

  private

  def sheep_params
    params.require(:sheep).permit(:genre, :weight, :kind)
  end
end
