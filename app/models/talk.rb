class Talk < ActiveRecord::Base
   belongs_to :room
   belongs_to :send_user, :class_name => 'User'
 end
