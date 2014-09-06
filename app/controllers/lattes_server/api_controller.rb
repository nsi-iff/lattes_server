require 'lattes_api'

module LattesServer
  class ApiController < ApplicationController
    respond_to :json
    rescue_from LattesApi::AccessDenied, with: :access_denied

    def id
      cpf = JSON.parse(request.body.read)['cpf']
      cnpq_id = client.get_identificador_cnpq(cpf)
      render json: { id: cnpq_id }
    end

    def curriculo_compactado
      cnpq_id = JSON.parse(request.body.read)['id']
      zipped_curriculum = client.get_curriculo_compactado(cnpq_id)
      render json: { curriculo: zipped_curriculum }
    end

    private

    def client
      @client ||= LattesApi::Api.new
    end

    def access_denied
      render json: { access_denied: true }, status: :forbidden
    end
  end
end
