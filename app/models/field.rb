class Field < ApplicationRecord
  has_many :sheeps, dependent: :destroy
  has_many :ownings, dependent: :destroy
  has_many :users, through: :ownings
  validates :name, presence: true

  def self.own_by_user(current_user)
    user_fields = []
    Field.all.each do |field|
      field.ownings.each do |owning|
        user_fields << Field.find(field.id) if owning.user == current_user
      end
    end
    user_fields
  end
end
