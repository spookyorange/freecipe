Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes do
    resources :ingredients, except: [:index, :show]
    resources :steps, except: [:index, :show]
  end

  resources :profiles, except: [:destroy, :index]
end
