require 'rails_helper'

describe 'getIdentificadorCNPq(cpf)' do
  it 'gets "identificador CNPq" given a CPF' do
    cpf = '12345678909'
    cnpq_id = '1234567890123456'
    client = double
    allow(client).to receive(:get_identificador_cnpq).with(cpf).
      and_return(cnpq_id)
    allow(LattesApi::Client).to receive(:new).and_return(client)

    get 'lattes_server/id', {}, { 'RAW_POST_DATA' => { cpf: cpf }.to_json }
    expect(response).to be_success
    expect(json).to eq('id' => cnpq_id)
  end
end
