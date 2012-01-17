Fedexday::Application.routes.draw do
  resources :ideas do
    member do
      put 'scratch'
    end
  end
  
  resources :endorsements
  resources :comments

  root :to => 'ideas#index'
end
