class AcceptsController < ApplicationController

  def create
    @accept = Accept.new(create_params)
    @accept.save
    redirect_to :root
  end

  def index
    @flagaccept = Accept.where(flag: 1)
    @id = @flagaccept.pluck(:request_id)
    @requests = Request.where(user_id: current_user.id).where.not(id: @id)
    @accepts = Accept.where(request_id: @requests.ids).includes(:user).includes(:request)
  end

   def create_params
    params.require(:accept).permit(:state, :address, :request_id, :user_id, :message, :flag)
  end

  def update
    # binding.pry
    @accept = Accept.find(params[:id])
    binding.pry
    @accept.flag = 1
    @accept.save
    @rooms = Room.create(user_one_id: current_user.id, user_two_id: @accept.user_id)
    redirect_to :root
  end
end

