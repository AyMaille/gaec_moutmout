require 'csv'


class LotsController < ApplicationController
  def new
    @lot = Lot.new
    @fields = Field.own_by_user(current_user)
  end

  def create
    # lot_name = regex   params[:lot][:filename???]
    Sheep.import(params[:lot][:file])
    flash[:notice] = "Lot # téléchargé avec succès"
    redirect_to field_path() #=> or where you want
  end
end
