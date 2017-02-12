class LoanApplication
  include ActiveModel::Model

  attr_accessor :stage

  def initialize
    @stage = :sign_up
  end

  class << self
    def load(uuid)
      events = Event.where(aggregate_root_uuid: uuid, aggregate_root_name: self.to_s).order(created_at: :asc)
      events.reduce(LoanApplication.new) { |loan_app, event| loan_app.apply(event) }
    end
  end

  def apply(event)
    Rails.logger.error(event.name)
    if event.name == "Events::SignedUp"
      @stage = :business_info
    end
    self
  end
end
