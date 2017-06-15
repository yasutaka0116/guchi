class RequestsController < ApplicationController
   before_action :authenticate_user!, only:[:new]
  def index
    @requests = Request.order('created_at DESC').page(params[:page])
  end

  def lithen
    @requests = Request.where(role: 0).order('created_at DESC').includes(:user).page(params[:page])
    render :index
  end

  def grumbl
     @requests = Request.where(role: 1).order('created_at DESC').includes(:user).page(params[:page])
    render :index
  end

  def today
    today = Date.today
    to = today+1.year
    @requests = Request.where(date: today...to).order('date ASC').page(params[:page])
    render :index
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(create_params)
    if @request.save
      flash[:success]= "リクエストテーブルをつくりました！"
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @request=Request.find(params[:id])
    @accept = Accept.new
    @accepts = Accept.where(request_id: params[:id])
  end

   private

  def create_params
    params.require(:request).permit(:state, :address, :starttime, :user_id, :endtime, :message, :date, :role)
  end
end
