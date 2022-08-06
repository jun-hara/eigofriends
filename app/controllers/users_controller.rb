class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create]
  before_action :ensure_correct_user, except: [:new, :create]
  before_action :forbid_user_logged_in, only: [:new, :create]
  
  def dashboard

  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully registered user"
    else
      render :new
    end
  end

  def edit
    @user = User.find(Current.user.id)
  end

  def update
    @user = User.find(Current.user.id)
    if @user.update(user_params)
      redirect_to root_path, notice: "Account successfully updated"
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      redirect_to edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
