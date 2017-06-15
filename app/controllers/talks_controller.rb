class TalksController < ApplicationController
   before_action :authenticate_user!, only:[:show]
  def show
    @talks = Talk.where(room_id: params[:id])
    @room = Room.find(params[:id])
    if @room.user_one_id == current_user.id || @room.user_two_id == current_user.id
      @room.user_one_id == current_user.id ? @user = User.find(@room.user_two_id) : @user = User.find(@room.user_one_id)
    else
      redirect_to :root
    end
  end
end
