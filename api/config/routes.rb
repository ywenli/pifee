Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # api test action
      resources :test, only:[:index]
    end
  end
end
