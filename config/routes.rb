Go::Application.routes.draw do
  
  get '/' => 'application#root'
  get '/games/my_turn' => 'games#my_turn'
  get 'games/mine' => 'games#mine'
  get '/games/open' => 'games#open'
  get '/games' => 'games#index'
  get '/games/new' => 'games#new'
  get '/games/:id' => 'games#show'
  post '/games/:id/move' => 'games#move'
  get '/games/:id/join/:color' => 'games#join'
  get '/login' => 'session#login_page'
  post '/login' => 'session#login'
  match '/logout' => 'session#logout'

end
