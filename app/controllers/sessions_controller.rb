class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user && user.password == params[:password]
      session[:user_id] = user.id
      flash[:sucess]    = 'Logado com sucesso!'

      redirect_to home_path
    else
      flash.now[:alert] = 'Inválido e-mail ou senha.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error]     = 'Deslogado com sucesso!'

    redirect_to root_path
  end
end
