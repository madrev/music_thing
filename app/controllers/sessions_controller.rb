class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]


  def new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:email], session_params[:password])
    if user.nil?
      flash[:errors] = ["We couldn't find that account"]
      redirect_to new_session_url
    else
      log_in(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
