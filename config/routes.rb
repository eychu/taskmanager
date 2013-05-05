Taskmanager::Application.routes.draw do

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  root :to => 'stories#index'

  resources :sessions, :only => [:new, :create, :destroy]

  resources :stories do
    member do
      get 'next_state'
    end
    resources :story_comments, :only => [:create, :destroy]
  end
  resources :users, :only => [:new, :create, :destroy]

end
