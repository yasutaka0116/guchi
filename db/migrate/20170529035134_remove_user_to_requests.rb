class RemoveUserToRequests < ActiveRecord::Migration
  def self.up
    remove_column :requests, :user_id_id, :integer
  end
end
