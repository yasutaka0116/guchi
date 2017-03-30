class Requests::GrumblController < ApplicationController
 def index
    @requests = Request.where(role: 1).includes(:user)
  end
end
