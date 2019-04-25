Rails.application.routes.draw do
  root to: 'goods#index'
  resources :goods do
    collection do
      post 'import', to: 'goods#import'
    end
  end
end
