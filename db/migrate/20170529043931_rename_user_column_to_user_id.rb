class RenameUserColumnToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :user, :user_id
  end
end
