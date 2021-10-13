class SheepsController < ApplicationController
  def index
    # @sheeps = []
    # fields.each do |field|
    #   field.ownings.each do |owning|
    #     if owning.user == current_user
    #       Sheep.where(field_id: field.id).each { |owner_field| @sheeps << owner_field }
    #     end
    #   end
    # end
    @sheeps = []
    Field.all.each do |field|
      field.ownings.each do |field_owning|
        field.sheeps.each { |sheep| @sheeps << sheep } if current_user.ownings.include?(field_owning)
      end
    end
  end

  def show
    @sheep = Sheep.find(params[:id])
  end

  def new
    @field = Field.find(params[:field_id])
    @sheep = Sheep.new
    @sheeps = Sheep.where(field_id: params[:field_id]).select { |sheep| sheep.kind == "sheep" }
  end

  def create
    @sheep = Sheep.new(sheep_params)
    @sheep.kind = "jeune"
    @sheep.age = 0
    @sheep.pregnant = false
    @sheep.expected_lambs = 0
    @sheep.field = Field.find(params[:field_id])
    @sheep.status = "alive"
    @sheep.save!
    redirect_to new_field_sheep_path
  end

  def update
  end

  private

  def sheep_params
    params.require(:sheep).permit(:genre, :weight, :mother_id)
  end
end
