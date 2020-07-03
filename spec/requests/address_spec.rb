require 'rails_helper'
require 'jwt'

 RSpec.describe 'Addresses tests ' do
    describe 'GET /addresses' do
        it 'Retorno Não Autorizado' do
            get('/api/addresses')
            json = JSON.parse(response.body)

            expect(json['error']).to eql('Não autorizado')
        end

        it 'Retorno Endereço retornado' do
            user = FactoryGirl.create(:user)

            post "/authenticate", params: "{\"email\": \"#{user.email}\",\"password\": \"#{user.password}\"}", :headers => { "CONTENT_TYPE" => "application/json" }
            parsed_body = JSON.parse(response.body)

            get('/api/addresses',:headers => {'Authorization' => parsed_body['auth_token']})
            json = JSON.parse(response.body)

            expect(json['message']).to eql('Endereços retornados com sucesso')
        end
    end

    describe 'POST /addresses' do
        it 'Retorno não autorizado' do
            post "/api/addresses", params: '{"cep": "35930009"}', :headers => { "CONTENT_TYPE" => "application/json" }
            json = JSON.parse(response.body)

            expect(json['error']).to eql('Não autorizado')
        end

        it 'Retorno CEP salvo' do
            user = FactoryGirl.create(:user)
            post "/authenticate", params: "{\"email\": \"#{user.email}\",\"password\": \"#{user.password}\"}", :headers => { "CONTENT_TYPE" => "application/json" }
            
            parsed_body = JSON.parse(response.body)


            post "/api/addresses", params: '{"cep": "12446020"}', :headers => { "CONTENT_TYPE" => "application/json", 'Authorization' => parsed_body['auth_token']}
            json = JSON.parse(response.body)

            expect(json['message']).to eql('Sucesso ao salvar informações do CEP')
            expect(json['data']['cep']). to eql(12446020)
        end

        it 'Retorno CEP retornado' do
            user = FactoryGirl.create(:user)
            post "/authenticate", params: "{\"email\": \"#{user.email}\",\"password\": \"#{user.password}\"}", :headers => { "CONTENT_TYPE" => "application/json" }
            
            parsed_body = JSON.parse(response.body)

            address = FactoryGirl.create(:address)

            post "/api/addresses", params: '{"cep": "35930009"}', :headers => { "CONTENT_TYPE" => "application/json", 'Authorization' => parsed_body['auth_token']}
            json = JSON.parse(response.body)

            expect(json['message']).to eql('Sucesso ao retornar informações do CEP')
            expect(json['data']['cep']). to eql(35930009)
        end
    end
 end