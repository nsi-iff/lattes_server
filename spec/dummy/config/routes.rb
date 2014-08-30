Rails.application.routes.draw do
  mount LattesServer::Engine => "/lattes_server"
end
