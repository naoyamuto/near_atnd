class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました。こんにちは、#{@user.nickname}さん！"
    rescue
      flash[:warning] = "認証中にエラーが発生しました・・"
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'ログアウトしました。'
    end
    redirect_to root_path
  end
end
