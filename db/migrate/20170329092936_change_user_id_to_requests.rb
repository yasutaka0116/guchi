class ChangeUserIdToRequests < ActiveRecord::Migration
  def up
    change_column :requests, :user_id, :references, foreign_key: true
  end
  def down
    change_column :requests, :user_id, :integer
  end
end
