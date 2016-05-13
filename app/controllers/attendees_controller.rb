class AttendeesController < ApplicationController

  def create
    @attendee = current_user.attendees.build do |a|
      a.event_id = params[:event_id]
      a.status = "attended"
    end
    if attendee.save
      flash[:success] = "イベントの参加を受け付けました。"
      redirect_to root_path
    end
  end

end
