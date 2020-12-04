Rails.application.routes.draw do
  resources :chessboards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'chessboards#index'
end
