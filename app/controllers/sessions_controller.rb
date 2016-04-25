class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You're all signed in, #{user.first_name}!"
      redirect_to root_path
    else
      flash.now[:notice] = "Heads up: That email/password combination is incorrect!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're all signed out! We'll see you soon."
  end
end
