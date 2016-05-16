class SessionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "こんにちは、#{@user.nickname}さん！"
    rescue
      flash[:warning] = "ログインに失敗しました。"
    end
    redirect_to events_path
  end

  def failure
    flash[:warning] = "ログインに失敗しました。"
    redirect_to events_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      # flash[:success] = 'ログアウトしました。'
    end
    redirect_to events_path
  end
end
