class CreateSheep < ActiveRecord::Migration[6.0]
  def change
    create_table :sheep do |t|
      t.string :genre
      t.integer :age
      t.float :weight
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
