Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  resources :books
  resources :sentences
  resources :translations
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
