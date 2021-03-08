Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # api test action
      resources :test, only:[:index]
      resources :users, only:[] do
        get :current_user, action: :show, on: :collection
      end
      # login, logout
      resources :user_token, only: [:create] do
        delete :destroy, on: :collection
      end
      resources :works
    end
  end
end
