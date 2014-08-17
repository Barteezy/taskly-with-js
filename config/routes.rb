Rails.application.routes.draw do

  root "task_lists#index"

  get "signin" => "sessions#new"

  post "signin" => "sessions#create"

  get "signout" => "sessions#delete"

  get "about" => "pages#about"

  resources :task_lists do
    resources :tasks
  end

end
