class RequestsController < ApplicationController
   before_action :authenticate_user!, only:[:index]

  def index
    @requests = Request.all.includes(:user)
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(create_params)
    @request.save
    flash[:notice]= "リクエストテーブルをつくりました！"
    redirect_to :root
  end

  def show
    @request=Request.find(params[:id])
    @accept = Accept.new
  end

   private

  def create_params
    params.require(:request).permit(:state, :address, :starttime, :user_id, :endtime, :message, :date, :role)
  end
end
