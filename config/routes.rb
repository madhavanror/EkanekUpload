Rails.application.routes.draw do
  root 'users#login'
  resources :documents, only: %i[index new create destroy]
  get '/document/:id/download', to: 'documents#download', as: :download
  post '/login', to: 'users#verify_login'
  get '/log_out', to: 'users#log_out'
  get 'sign_up', to: 'users#new'
  post 'create', to: 'users#create'
end
