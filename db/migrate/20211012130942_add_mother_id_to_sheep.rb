class AddMotherIdToSheep < ActiveRecord::Migration[6.0]
  def change
    add_column :sheep, :mother_id, :integer
  end
end
