Taskmanager::Application.routes.draw do

  root :to => 'stories#index'

  resources :sessions, :only => [:new, :create, :destroy]

  resources :stories do
    put :next_state, :on => :member
    resources :story_comments, :only => [:create, :destroy]
  end
  resources :users, :only => [:new, :create, :destroy]

end
