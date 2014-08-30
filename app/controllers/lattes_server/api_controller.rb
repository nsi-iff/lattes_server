module LattesServer
  class ApiController < ApplicationController
    respond_to :json

    def id
      cpf = JSON.parse(request.body.read)['cpf']
      cnpq_id = client.get_identificador_cnpq(cpf)
      render json: { id: cnpq_id }
    end

    private

    def client
      @client ||= LattesApi::Client.new
    end
  end
end
