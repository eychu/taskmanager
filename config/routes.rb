Taskmanager::Application.routes.draw do

  scope module: :web do
    root to: 'stories#index'

    resources :sessions, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]

    resources :stories do
      scope module: 'stories' do
        put :next_state, on: :member
        resources :story_comments, only: [:create, :destroy]
      end
    end
  end


end
