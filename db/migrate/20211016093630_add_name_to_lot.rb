class AddNameToLot < ActiveRecord::Migration[6.0]
  def change
    add_column :lots, :name, :string
  end
end
