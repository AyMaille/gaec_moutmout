class ChangeIntegerLimitInLots < ActiveRecord::Migration[6.0]
  def change
    change_column :sheep, :electronic_id, :integer, limit: 8
  end
end
