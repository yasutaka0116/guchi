class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader

  has_many :requests
  has_many :accepts

   has_many :user_one, :class_name => 'room', :foreign_key => 'user_one_id', :dependent => :destroy
   has_many :user_two, :class_name => 'room', :foreign_key => 'user_two_id', :dependent => :destroy

   has_many :talks
end
