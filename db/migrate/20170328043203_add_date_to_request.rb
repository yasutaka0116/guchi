class AddDateToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :date, :date
  end
end
