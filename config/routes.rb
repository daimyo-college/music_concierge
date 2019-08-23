Rails.application.routes.draw do
  get '/' => 'home#top'
  get '/index' => 'users#index'
  post '/' => 'users#send_album_mail'

  post '/create' => 'users#create'
  get '/create' => 'home#top'

  post '/delete' => 'users#delete'
  get '/delete' => 'home#top'
  post '/:id/delete' => 'users#delete_from_index'
  post '/:id/send_instant' => 'users#send_instant'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end