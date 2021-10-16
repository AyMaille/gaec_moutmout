require 'csv'


class LotsController < ApplicationController
  def index
    @lots = Lot.all
  end

  def new
    @lot = Lot.new
    @fields = Field.own_by_user(current_user)
  end

  def create
    field = Field.find_by(name: params[:lot][:field])
    Sheep.import(params[:lot][:file], field)
    flash[:notice] = "Lot #{Lot.last.id} téléchargé avec succès" #=> interpolation to changed
    redirect_to field_path(field)
  end
end
