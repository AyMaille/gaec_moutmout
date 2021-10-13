class CreateActs < ActiveRecord::Migration[6.0]
  def change
    create_table :acts do |t|
      t.references :sheep, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.string :note

      t.timestamps
    end
  end
end
