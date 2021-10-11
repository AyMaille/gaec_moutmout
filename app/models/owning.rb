class Owning < ApplicationRecord
  belongs_to :field
  belongs_to :user
end
