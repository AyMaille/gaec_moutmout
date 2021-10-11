class CreateOwnings < ActiveRecord::Migration[6.0]
  def change
    create_table :ownings do |t|
      t.references :field, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
