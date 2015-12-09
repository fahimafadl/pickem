class SessionsController < ApplicationController
  def new
    session[:errors] = false
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    else
      session[:errors] = true
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
