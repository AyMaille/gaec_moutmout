class CreateLots < ActiveRecord::Migration[6.0]
  def change
    create_table :lots do |t|
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
