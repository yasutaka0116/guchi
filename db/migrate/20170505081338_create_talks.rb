class CreateTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :talks do |t|
      t.references :send_user
      t.references :room, foreign_key: true
      t.text :message
      t.timestamps null: false
    end
     add_foreign_key :talks, :users, column: :send_user_id
  end
end
