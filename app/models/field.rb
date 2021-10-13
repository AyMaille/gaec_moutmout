class Field < ApplicationRecord
  has_many :sheeps, dependent: :destroy
  has_many :ownings, dependent: :destroy
  has_many :users, through: :ownings
  validates :name, presence: true
end
