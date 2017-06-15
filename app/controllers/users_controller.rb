class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @a = Accept.where(user_id: @user.id, flag: 1).joins(:request).merge(Request.where(role: 1))
    #いうリクエスト成立
    @b = Accept.where(user_id: @user.id, flag: 1).joins(:request).merge(Request.where(role: 0))
    #聞く募集成立
    @c = Request.where(user_id: @user.id, role:0).joins(:accepts).merge(Accept.where(flag: 1))
    #いう募集成立
    @d = Request.where(user_id: @user.id, role:1).joins(:accepts).merge(Accept.where(flag: 1))
    @lithen = @a+@c
    @grumbl = @b+@d
    @requests = Request.where(user_id: @user.id).order('created_at DESC')
  end
end
