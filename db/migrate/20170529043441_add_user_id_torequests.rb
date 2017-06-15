class AddUserIdTorequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :user, :integer, :after => :id
    add_index :requests, :user
  end
end
