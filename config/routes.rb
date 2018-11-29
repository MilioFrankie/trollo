Rails.application.routes.draw do
  root "boards#index"
  devise_for :users

  resources :boards do 
    resources :lists
  end
  
  scope 'lists/:list_id', as: 'list' do
    resources :tasks
  end

end
