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
      post'current_workouts/remove_exercise', to: 'current_workouts#remove_exercise'

      get '/users_without_trainers', to: 'users#users_without_trainers'

      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/current_user/workouts', to: 'auth#show_workouts'

      get '/current_user/clients', to: 'trainer#get_clients'
      post '/current_user/send_client_request', to: 'trainer#send_client_request'
      post '/current_user/add_client', to: 'trainer#add_client'
      post '/trainer/share_routine', to:'trainer#share_routine'

      get '/current_user/get_notifications', to: 'users#get_notifications'

      post '/current_user/accept_request', to: 'client#accept_request'


    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
