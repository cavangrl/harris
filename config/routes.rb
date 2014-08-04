Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  resources :users

  get 'home/index'

  resources :projects do
    resources :cards, except: [:index, :show] do
    	collection {post :sort}
	end
  end

  root 'home#index'

end
