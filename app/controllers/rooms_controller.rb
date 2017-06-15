class RoomsController < ApplicationController
   before_action :authenticate_user!, only:[:index]
  def index
    @rooms = Room.where(user_one_id: current_user.id).or(Room.where(user_two_id: current_user.id)).includes(:user_one).includes(:user_two).order('created_at DESC')
  end
end
