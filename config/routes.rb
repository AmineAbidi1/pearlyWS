Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'getRooms', to: 'rooms#index'
    end
  end
end
