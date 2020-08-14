class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      redirect_and_handle_session(user)
    else
      flash.now[:alert] = 'Invalid email/password combination!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_url, notice: 'You are now signed out!'
  end

  private

  def redirect_and_handle_session(user)
    session[:user_id] = user.id
    redirect_to (session[:intended_url] || user), notice: "Welcome back, #{user.name}!"
    session[:intended_url] = nil
  end
end
