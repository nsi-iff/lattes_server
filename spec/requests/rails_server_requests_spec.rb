require 'rails_helper'
require 'pry-rails'

describe 'rails_server requests' do
  let(:cnpq_id) { '1234567890123456' }

  let(:client) do
    client = double
    allow(LattesApi::Api).to receive(:new).and_return(client)
    client
  end

  it 'gets "identificador CNPq" given a CPF' do
    cpf = '12345678909'
    allow(client).to receive(:get_identificador_cnpq).with(cpf).
      and_return(cnpq_id)
    get 'lattes_server/id', {}, { 'RAW_POST_DATA' => { cpf: cpf }.to_json }
    expect(response).to be_success
    expect(json).to eq('id' => cnpq_id)
  end

  it 'returns a zipped curriculum given a cnpq id' do
    allow(client).to receive(:get_curriculo_compactado).with(cnpq_id).
      and_return(:zipped_curriculum)
    get 'lattes_server/curriculo_compactado', {},
      { 'RAW_POST_DATA' => { id: cnpq_id }.to_json }
    expect(response).to be_success
    expect(json).to eq('curriculo' => 'zipped_curriculum')
  end

  it 'access denied' do
    allow(client).to receive(:get_curriculo_compactado).
      and_raise(LattesApi::AccessDenied)
    get 'lattes_server/curriculo_compactado', {},
      { 'RAW_POST_DATA' => { id: cnpq_id }.to_json }
    expect(response).to be_forbidden
    expect(json).to eq('access_denied' => true)
  end
end
