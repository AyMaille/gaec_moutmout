class AddUserIdToLot < ActiveRecord::Migration[6.0]
  def change
    add_reference :lots, :user, foreign_key: true
  end
end
