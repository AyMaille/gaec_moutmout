class AddPregnantToSheep < ActiveRecord::Migration[6.0]
  def change
    add_column :sheep, :pregnant, :boolean
  end
end
