class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]

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
      redirect_to new_user_company_path(@user)
      flash[:notice] = "Welcome, #{@user.first_name.strip}! Just one more step and you should be good to go."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Your account was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Your personal account has been successfully removed from the site!"
  end

  private

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_url, notice: "You do not have permission to do that."
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
