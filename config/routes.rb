Rails.application.routes.draw do
  resources :tasks do
    member do
      patch 'complete'
      patch 'undo'
    end
  end

  root 'tasks#index'
end
