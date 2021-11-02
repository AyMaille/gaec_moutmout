class CornerPositionsController < ApplicationController
  def create
    @corner_position = Corner_position.new(params[:user])

    respond_to do |format|
      if @corner_position.save
        format.html { redirect_to @fields, notice: 'Coordonnées sauvegardées' }
        format.js
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
