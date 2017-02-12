class LoanApplicationsController < ApplicationController
  before_action do
    loan_app_uuid = session[:loan_application_uuid] ||= SecureRandom.uuid
    @loan_application_uuid =  loan_app_uuid
  end

  def index

  end

  def show
    loan_application = LoanApplication.load(@loan_application_uuid)

    case loan_application.stage
    when :sign_up
      render :first_step
    when :business_info
      render :business_info_step
    else
      raise :whups
    end
  end
end
