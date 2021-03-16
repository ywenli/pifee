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
      resources :tags, only: [:index, :show], param: :name
      resources :likes, only: [:index, :create, :destroy] do
        # ランキング(today, weekly, all)
        get :today_ranking, action: :get_top_6_in_today_ranking, on: :collection
        get :weekly_ranking, action: :get_top_6_in_weekly_ranking, on: :collection
        get :all_ranking, action: :get_top_6_in_all_ranking, on: :collection
      end
    end
  end
end
