class EventsController < ApplicationController
  before_action :logged_in_user, only:[:new, :create, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "イベントが公開されました！"
      redirect_to @event
    else
      render 'events/new'
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
  end

  def destroy
  end


  private

    def event_params
      params.require(:event).permit(:title, :hold_at, :capacity, :location, :owner, :description)
    end
end
