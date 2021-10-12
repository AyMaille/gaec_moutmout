class AddKindToSheep < ActiveRecord::Migration[6.0]
  def change
    add_column :sheep, :kind, :string
  end
end
