require 'rails_helper'

describe 'getIdentificadorCNPq(cpf)' do
  let(:cnpq_id) { '1234567890123456' }

  it 'gets "identificador CNPq" given a CPF' do
    cpf = '12345678909'
    client = double
    allow(client).to receive(:get_identificador_cnpq).with(cpf).
      and_return(cnpq_id)
    allow(LattesApi::Api).to receive(:new).and_return(client)

    get 'lattes_server/id', {}, { 'RAW_POST_DATA' => { cpf: cpf }.to_json }
    expect(response).to be_success
    expect(json).to eq('id' => cnpq_id)
  end

  it 'returns a zipped curriculum given a cnpq id' do
    client = double
    allow(client).to receive(:get_curriculo_compactado).with(cnpq_id).
      and_return(:zipped_curriculum)
    allow(LattesApi::Api).to receive(:new).and_return(client)

    get 'lattes_server/curriculo_compactado', {},
      { 'RAW_POST_DATA' => { id: cnpq_id }.to_json }
    expect(response).to be_success
    expect(json).to eq('curriculo' => 'zipped_curriculum')
  end
end
