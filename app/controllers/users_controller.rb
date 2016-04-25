class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_company_path
      flash[:notice] = "Welcome, #{@user.first_name.strip}! Just one more step and you should be good to go."
    else
      render :new
    end
  end

  def destroy
    @user = User.find(user_params)
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Your personal account has been successfully removed from the site!"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
