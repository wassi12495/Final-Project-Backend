Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      resources :users
      resources :exercises
      resources :workouts
      resources :routines
      resources :current_workouts

      get '/exercise_categories', to: 'exercise_categories#index'

      post '/current_workouts/add_exercise', to: 'current_workouts#add_exercise'


      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/current_user/workouts', to: 'auth#show_workouts'

      get '/current_user/clients', to: 'trainer#get_clients'
      post '/current_user/send_client_request', to: 'trainer#send_client_request'
      post '/current_user/add_client', to: 'trainer#add_client'


    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
