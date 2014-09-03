LattesServer::Engine.routes.draw do
  get '/id', to: 'api#id'
  get '/curriculo_compactado', to: 'api#curriculo_compactado'
end
