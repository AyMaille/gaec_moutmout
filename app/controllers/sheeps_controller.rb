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
    @field = Field.find(params[:field_id])
    @sheep = Sheep.new(sheep_params)
    @sheep.field = Field.find(params[:field_id])
    @sheep.electronic_id = Sheep.last.electronic_id.to_i + 1
    if @sheep.save
      flash[:notice] = "Jeune n°#{@sheep.electronic_id} ajouté"
      redirect_to new_field_sheep_path
    else
      @sheeps = Sheep.where(field_id: @field).select { |sheep| sheep.kind == "sheep" }
      flash.now[:error] = "Erreur, champ manquants"
      render :new
    end
  end

  def update
  end

  private

  def sheep_params
    params.require(:sheep).permit(:genre, :weight, :mother_id)
  end
end
