class RemoveUserIdToReuqests < ActiveRecord::Migration
  def change
    remove_column :requests, :user_id, :integer
  end
end
