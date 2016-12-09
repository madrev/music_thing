class UsersController < ApplicationController
  before_action :redirect_unless_logged_in, only: [:show]
  before_action :redirect_if_logged_in, only: [:new]


  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end

  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
