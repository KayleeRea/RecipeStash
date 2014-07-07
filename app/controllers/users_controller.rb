class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email], password: params[:user][:password])
    if @user.save
      redirect_to new_session_path, notice: "Registered! Please login now"
    else
      render :new
    end
  end
end