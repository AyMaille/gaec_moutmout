class ChangeTypeToUserName < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :type, :user_name
  end
end
