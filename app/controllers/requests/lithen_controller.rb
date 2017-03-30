class Requests::LithenController < ApplicationController
 def index
    @requests = Request.where(role: 0).includes(:user)
  end
end
