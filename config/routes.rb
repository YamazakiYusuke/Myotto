Rails.application.routes.draw do
  root to: 'translations#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  resources :books
  resources :sentences
  resources :translations
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
