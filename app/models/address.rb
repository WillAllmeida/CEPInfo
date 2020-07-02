class Address < ApplicationRecord
    validates :cep, length: { is: 8, message:'Tamanho inválido, verifique o CEP digitado' }
    validates :uf, presence: true
    validates :city, presence: true
    validates :district, presence: true
    validates :address, presence: true
end
