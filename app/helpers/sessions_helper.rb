module SessionsHelper

  # 現在ログインしているユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログインしているかどうかを返す
  def logged_in?
    !current_user.nil?
  end

  #ユーザーのログイン状態を確認する
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to events_path
    end
  end

end
