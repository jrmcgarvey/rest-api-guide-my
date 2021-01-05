Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :facts
      end
    end
  end
  match '*path', to: 'application#routing_error', via: :all
end
