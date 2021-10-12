class AddExpectedLambsToSheep < ActiveRecord::Migration[6.0]
  def change
    add_column :sheep, :expected_lambs, :integer
  end
end
