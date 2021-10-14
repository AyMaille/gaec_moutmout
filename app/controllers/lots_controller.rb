require 'csv'


class LotsController < ApplicationController
  def new
    @lot = Lot.new
  end

  def create
    # lot_name = regex   params[:lot][:filename???]
    Lot.import(params[:lot][:file])
    flash[:notice] = "Lot # téléchargé avec succès"
    redirect_to field_path() #=> or where you want
  end
end
