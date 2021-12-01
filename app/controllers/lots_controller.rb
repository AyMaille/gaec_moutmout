require 'csv'


class LotsController < ApplicationController
  def index
    @lots = Lot.where(user_id: current_user)
  end

  def show
    @lot = Lot.find(params[:id])
    @sheeps = Sheep.where(lot_id: @lot)
  end

  def new
    @lot = Lot.new
    @fields = Field.own_by_user(current_user)
  end

  def create
    field = Field.find_by(name: params[:lot][:field])
    @lot = Lot.create(field: field, name: params[:lot][:name])
    Sheep.import(params[:lot][:file], field)
    flash[:notice] = "Lot #{Lot.last.name} téléchargé avec succès" #=> interpolation to changed
    redirect_to field_path(field)
  end

  def edit
    @lot = Lot.find(params[:id])
    @fields = Field.own_by_user(current_user)
  end
end
