class CreateCornerPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :corner_positions do |t|
      t.references :field, null: false, foreign_key: true
      t.float :long
      t.float :lat

      t.timestamps
    end
  end
end
