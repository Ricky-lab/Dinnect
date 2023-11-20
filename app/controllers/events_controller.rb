class EventsController < ApplicationController

  def index
    @events = Event.all
    @user_events_by_event_id = UserEvent.where(role: "holder").includes(:user).group_by(&:event_id)
  end

  def show
    @event = Event.find(params[:id])
    @user_events_by_event_id = UserEvent.where(role: "holder").includes(:user).group_by(&:event_id)
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @holder ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @user_event = UserEvent.new(
          user: @holder,
          event: @event,
          role: "holder"
        )

    if @event.save && @user_event.save
        redirect_to '/users/'+session[:user_id].to_s+'/my_events', notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to '/users/'+session[:user_id].to_s+'/my_events', notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def join
    @event = Event.find(params[:id])
    @participant ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @user_event = UserEvent.new(
      user: @participant,
      event: @event,
      role: "participator"
    )

    if @user_event.save
      redirect_to @event, notice: 'You have successfully joined the event.'
    else
      redirect_to @event, alert: 'Unable to join the event.'
    end
  end

  def leave
    @event = Event.find(params[:id])
    current_user.user_events.find_by(event: @event, role: "participator")&.destroy

    redirect_to @event, notice: 'You have successfully left the event.'
  end

  def cancel
    @event = Event.find(params[:id])
    @event.update(status: 'cancelled')

    redirect_to @event, notice: 'The event has been cancelled.'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :duration,:location_name,:location_coordinates,:status)
  end
end
