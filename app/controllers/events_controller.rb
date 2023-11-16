class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :duration,:location_name,:location_coordinates,:status)
  end
end
