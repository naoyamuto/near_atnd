class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "こんにちは、#{@user.name}さん！"
    redirect_to events_path
  end

  def failure
    flash[:warning] = "ログインに失敗しました。"
    redirect_to events_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
    end
    redirect_to events_path
  end
end
