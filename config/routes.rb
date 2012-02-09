Friendlocatr::Application.routes.draw do

  match 'user/:id/nearest_friends' => 'users#nearest_friends', :as => 'nearest_friends'
  get 'user/create' => 'users#create_ajax'

  resources :users do
    collection do
      get :nearest_friends
    end
  end

  root :to => 'users#index'
end
