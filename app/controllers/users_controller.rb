class UsersController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
