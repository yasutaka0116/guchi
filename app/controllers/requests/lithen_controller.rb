class Requests::LithenController < ApplicationController
 def index
    @requests = Request.where(role: 0).page(params[:request]).includes(:user)
  end
end
