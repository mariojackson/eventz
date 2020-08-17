class LikesController < ApplicationController
  before_action :require_signin

  def create
    @event = Event.find(params[:event_id])
    @event.likes.create!(user: logged_in_user)
    redirect_to @event
  end

  def destroy
    like = logged_in_user.likes.find(params[:id])
    like.destroy

    event = Event.find(params[:event_id])
    redirect_to event
  end
end
