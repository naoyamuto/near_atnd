class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    #ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインが必要です。"
        redirect_to root_path
      end
    end
end
