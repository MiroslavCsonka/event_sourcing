class EventsController < ActionController::Base
  def create


    Event.process(params[:event])
  end
end
