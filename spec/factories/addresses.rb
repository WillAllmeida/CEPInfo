FactoryGirl.define do
    factory :address, class: Address do
      cep "35930009"
      uf "MG"
      city "João Monlevade"
      district "São Geraldo"
      address "Rua Suíça"
    end
  end