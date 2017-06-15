class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader

  has_many :requests, :dependent => :destroy
  has_many :accepts, :dependent => :destroy
  has_many :user_one, :class_name => 'Room', :foreign_key => 'user_one_id', :dependent => :destroy
  has_many :user_two, :class_name => 'Room', :foreign_key => 'user_two_id', :dependent => :destroy
  has_many :send_user, :class_name => 'Talk',:foreign_key => 'send_user_id',:dependent => :destroy

   def frienduser
    user_one+user_two
   end

#バリデーション
   validates :name, presence: true, length: { maximum: 50 }
   validates :gender, inclusion: ["男",'女']
   validates :age, presence: true, numericality: { only_integer: true }
   validates :introduction, length: { maximum: 500 }

   after_create :welcome_send
   def welcome_send
     UserMailer.welcome_send(self).deliver
   end
end
