class AddLotToSheep < ActiveRecord::Migration[6.0]
  def change
    add_reference :sheep, :lot, foreign_key: true
  end
end
