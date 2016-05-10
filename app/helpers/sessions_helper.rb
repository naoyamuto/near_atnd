module SessionsHelper

  # 現在ログインしているユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
