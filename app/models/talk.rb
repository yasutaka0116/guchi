class Talk < ApplicationRecord
   belongs_to :room
   belongs_to :send_user, :class_name => 'User'
   after_create_commit { MessageBroadcastJob.perform_later self }
 end
