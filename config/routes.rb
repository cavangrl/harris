Rails.application.routes.draw do
  devise_for :users
  resources :users

  get 'home/index'

  resources :projects do
    resources :cards do
    	collection {post :sort}
	end
  end

  root 'home#index'

end
