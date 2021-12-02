class Lot < ApplicationRecord
  belongs_to :field
  has_many :sheeps
end
