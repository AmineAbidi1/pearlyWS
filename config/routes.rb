Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'getRooms', to: 'rooms#index'
      get 'getStatuses', to: 'rooms#get_statuses'
      post 'bookRoom', to: 'rooms#book'
      get '/reservations/:id', to: 'rooms#reservations'
    end
  end
end
