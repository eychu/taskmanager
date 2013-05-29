Taskmanager::Application.routes.draw do

  scope module: :web do
    root to: 'stories#index'

    resources :sessions, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]

    resources :stories do
      put :next_state, on: :member
      scope module: :stories do
        resources :comments, only: [:create, :destroy]
      end
    end
  end


end
