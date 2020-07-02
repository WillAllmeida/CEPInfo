class Address < ApplicationRecord
    validates :cep, length: { is: 8, message:'Tamanho inválido, verifique o CEP digitado' }
end
