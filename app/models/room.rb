class Room < ApplicationRecord
    belongs_to :frienduser, :class_name => 'User'
    belongs_to :user_one, :class_name => 'User'
    belongs_to :user_two, :class_name => 'User'
    has_many :talks, :dependent => :destroy
  def frienduser
    user_one+user_two
   end
end
