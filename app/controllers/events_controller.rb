class EventsController < ApplicationController
  before_action :logged_in_user, only:[:new, :edit, :create, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attended = @event.attendees.where(status: "attended")
    @absented = @event.attendees.where(status: "absented")

    if current_user
      @attend_status = current_user.attendees.where(event_id: params[:id], status: "attended").exists?
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = t(:created_event)
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = t(:updated_event)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    current_user.events.find(params[:id]).destroy
    flash[:danger] = t(:deleted_event)
    redirect_to events_path
  end

  def attend
    @attendee = current_user.attendees.find_by(event_id: params[:id])
    if @attendee
      @attendee.update_attribute(:status, "attended")
      flash[:success] = t(:attended_event)
      redirect_to event_path
    else
      @attendee = current_user.attendees.build do |a|
        a.event_id = params[:id]
        a.status = "attended"
      end
      @attendee.save
      flash[:success] = t(:attended_event)
      redirect_to event_path
    end
  end

  def absent
    @attendee = current_user.attendees.find_by(event_id: params[:id]).update_attribute(:status, "absented")
    flash[:danger] = t(:absented_event)
    redirect_to event_path
  end

  private

    def event_params
      params.require(:event).permit(:title, :hold_at, :capacity, :location, :owner, :description)
    end
end
