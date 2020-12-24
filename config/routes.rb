Rails.application.routes.draw do
  root to: 'translations#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  resources :books do
    resources :sentences, only: [:show, :edit, :update, :destroy]
  end

  resources :translations do
    resources :user_translation_comments, only: [:create]
    resources :user_translation_favorites, only: [:create, :destroy]
  end

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
