class Requests < ActiveRecord::Migration
  def change
     create_table :requests do |t|
      t.string  :state
      t.string  :address
      t.integer  :user_id
      t.integer  :starttime
      t.integer   :endtime
      t.text    :message
      t.timestamps null: false
    end
  end
end
