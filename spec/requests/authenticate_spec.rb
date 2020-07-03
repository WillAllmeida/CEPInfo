require 'rails_helper'
require 'jwt'

RSpec.describe 'Authorization tests ' do
    describe 'POST /authenticate' do
        it 'Retorno Dados inválidos (Dados incorretos inseridos)' do
            post "/authenticate", params: "{\"email\": \"admin@test.com\",\"password\": \"123123\"}", :headers => { "CONTENT_TYPE" => "application/json" }
            json = JSON.parse(response.body)

            expect(json['error']['user_authentication']).to eql('Dados inválidos')
        end

        it 'Retorno Dados inválidos (Nenhum dado inserido)' do
            post "/authenticate", params: "", :headers => { "CONTENT_TYPE" => "application/json" }
            json = JSON.parse(response.body)

            expect(json['error']['user_authentication']).to eql('Dados inválidos')
        end

        it 'Retorno Token (Dados corretos inseridos)' do
            user = FactoryGirl.create(:user)
            post "/authenticate", params: "{\"email\": \"#{user.email}\",\"password\": \"#{user.password}\"}", :headers => { "CONTENT_TYPE" => "application/json" }
            json = JSON.parse(response.body)
            puts json['auth_token']
            expect(json['auth_token']).to be_present
        end
    end
end