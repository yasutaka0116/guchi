class Requests::GrumblController < ApplicationController
 def index
    @requests = Request.where(role: 1).page(params[:request]).includes(:user)
  end
end
