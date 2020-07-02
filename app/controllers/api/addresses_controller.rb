require 'net/http'
module Api	
        class AddressesController < ApplicationController
            private
			def address_param
				params.permit(:cep)
			end
            
            public
            def index
                addresses = Address.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'sucesso', data:addresses},status: :ok
            end
            
            def create
                address = Address.new(address_param)

                addressCheck = Address.where(cep: params[:cep]).first
                if !addressCheck

                    uri = URI('http://cep.la/' + params[:cep])

                    Net::HTTP.start(uri.host, uri.port) {|http|
                        request = Net::HTTP::Get.new(uri)
                        request["Accept"] = "application/json"
                        response = http.request(request)
                        
                        
                        @result = JSON.parse(response.body)
                    }

                    address.city = @result["cidade"]
                    address.uf = @result["uf"]
                    address.address = @result["logradouro"]
                    address.district = @result["bairro"]

                    if address.save
                        render json: {status: 'SUCCESS', message:'Sucesso ao salvar informações do CEP', data:address},status: :ok
                    else
                        render json: {status: 'ERROR', message:'Erro ao buscar informações do CEP informado', data:address.errors},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'SUCCESS', message:'Sucesso ao retornar informações do CEP', data:addressCheck},status: :ok
                end

            end
		end
end