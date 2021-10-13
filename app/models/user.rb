class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ownings, dependent: :destroy
  has_many :fields, through: :ownings

  # def own_the_field?(field)
  #   ownings.include?(field)
  # end
end
