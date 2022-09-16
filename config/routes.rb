Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes do
    resources :ingredients, except: [:show]
    resources :steps, except: [:show]
  end

  resources :profiles, except: [:destroy, :index]
end
