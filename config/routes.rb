Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:id/edit', to: 'dealerships#edit'
  patch '/dealerships/:id', to: 'dealerships#update'
  get '/dealerships/:id/vehicles', to: 'dealership_vehicles#index'
  get '/dealerships/:id/vehicles/new', to: 'vehicles#new'
  post '/dealerships/:id/vehicles', to: 'vehicles#create'

  get '/vehicles/:id/edit', to: 'vehicles#edit'
  patch '/vehicles/:id', to: 'vehicles#update'
  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/:id', to: 'vehicles#show'
end
