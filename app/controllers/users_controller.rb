class UsersController < ApplicationController


  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @ride_info = params[:ride_info] if params[:ride_info]
    @ride_info ||= false
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
