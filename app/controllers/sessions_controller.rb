class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params[:user_name])
    if @user.save

      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def destroy
    # @session = session[:user_id]
    session.clear
    redirect_to root_path

  end
end
