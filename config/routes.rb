Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items


  #金額を取得したいのでqueryパラメーターを使用
get 'items', to: 'items#calculation'
end
