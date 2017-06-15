module RoomsHelper
  def finduser(a,b)
    a == current_user.id ? @user = User.find(b) : @user = User.find(a)
    return @user
  end
end
