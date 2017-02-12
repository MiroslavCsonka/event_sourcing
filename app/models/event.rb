class Event < ActiveRecord::Base
  class << self
    def process(event_data)
      event_class = event_data[:event_type].constantize

      event = event_class.new(event_data)
      if event.valid?
        create!(
          payload: event.to_h,
          name: event_class.to_s,
          aggregate_root_uuid: event_data[:aggregate_root_uuid],
          aggregate_root_name: event_data[:aggregate_root_name],
        )
        else redirect_to event_data[:referer]
      end
    end
  end
end
