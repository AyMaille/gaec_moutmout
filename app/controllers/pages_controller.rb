class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @fields = []
    Field.all.each do |field|
      field.ownings.each do |owning|
        @fields << Field.find(field.id) if owning.user == current_user
      end
    end
  end
end
