class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :user_one
      t.references :user_two
      t.timestamps null: false
    end
    add_foreign_key :rooms, :users, column: :user_one_id
    add_foreign_key :rooms, :users, column: :user_two_id
  end
end
