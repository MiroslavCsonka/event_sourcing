Rails.application.routes.draw do
  resource :loan_applications, only: [:index, :show]
  resource :events, only: [:create]

  root controller: :loan_applications, action: :index
end
