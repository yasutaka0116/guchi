class AddRoleToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :role, :integer
  end
end
