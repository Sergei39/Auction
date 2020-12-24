class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[login create]

  def login; end

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      p 'LOGIN'
      sign_in user
      redirect_to home_path
    else
      p 'REDIRECT'
      flash[:danger] = 'Невалидный логин и пароль'
      redirect_to session_login_path
    end
  end

  def logout
    sign_out
    redirect_to session_login_path
  end
end
