Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # api test action
      resources :test, only: [:index]
      resources :users, only: %i[index show update] do
        get :current_user, action: :show, on: :collection
      end
      # login, logout
      resources :user_token, only: [:create] do
        delete :destroy, on: :collection
      end
      resources :works do
        get :all, action: :get_works_all, on: :collection
        get :search, action: :search, on: :collection
      end
      resources :tags, only: %i[index show], param: :name
      resources :likes, only: %i[index create destroy] do
        # ランキング(daily, weekly, all)
        get :daily_ranking, action: :get_top_6_in_daily_ranking, on: :collection
        get :weekly_ranking, action: :get_top_6_in_weekly_ranking, on: :collection
        get :all_ranking, action: :get_top_6_in_all_ranking, on: :collection
      end
      resources :s3 do
        get :presigned_url, action: :presigned_url, on: :collection
      end
    end
  end
end
