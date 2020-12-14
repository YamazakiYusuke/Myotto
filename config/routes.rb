Rails.application.routes.draw do
  root to: 'translations#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :edit, :update]

  resources :books do
    resources :sentences
  end

  resources :translations do
    resources :user_translation_comments, only: [:create]
    resources :user_translation_favorites, only: [:create, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
