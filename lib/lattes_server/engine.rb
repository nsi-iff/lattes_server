module LattesServer
  class Engine < ::Rails::Engine
    isolate_namespace LattesServer

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
