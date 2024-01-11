class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :set_profiles

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:sucess]    = 'Usuário criado com sucesso.'

      redirect_to home_path
    else
      flash[:error] = 'Não foi possivel criar o usuário!'
      render :new 
    end
  end

  def edit; end

  def update
    user = params[:user]

    if @user.update(user_params)
      flash[:sucess] = 'Usuário atualizado com sucesso.'

      redirect_to users_path
    else
      flash[:error] = 'Não foi possivel atualizar o usuário!'
      render :edit
    end
  end

  def show; end

  def destroy
    user = User.find(params[:user_id])

    if user.destroy
      flash[:sucess] = 'Usuário apagado com sucesso.'
    else
      flash[:error] = 'Não foi apagar o usuário!'
    end

    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_profiles
    @profiles = ['admin', 'user']
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
