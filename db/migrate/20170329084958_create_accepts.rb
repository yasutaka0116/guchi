class CreateAccepts < ActiveRecord::Migration
  def change
    create_table :accepts do |t|
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true
      t.integer :flag
      t.text  :message
      t.timestamps null: false
    end
  end
end
