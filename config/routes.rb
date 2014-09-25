QaHub::Application.routes.draw do
  devise_for :users, path_names: { sign_up: 'register', sign_in: 'sign-in', sign_out: 'sign-out' }
  
  root to: 'static_pages#home'
  
  resources :releases
  
  resources :checklists do
  	get 'toggle_tool', on: :member
  	get 'toggle_item', on: :member
  	get 'toggle_applicable', on: :member
  end
  
  resources :release_items
  
  resources :comments
end
