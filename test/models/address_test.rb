require 'test_helper'

class AddressTest < ActiveSupport::TestCase
   test "Endereço vazio" do
    address = Address.new
    assert_not address.save
   end

   test "CEP válido, dados vazios" do
    address = Address.new(cep: '71015134')
    assert_not address.save
   end

   test "CEP inválido, dados vazios" do
    address = Address.new(cep: '9999999999')
    assert_not address.save
   end

   test "CEP válido, dados preenchidos" do
    address = Address.new(cep: '71015134', uf: 'DF', city: 'Brasilia', district: 'Asa Sul', address: 'SQS 313')
    assert address.save
   end

   test "CEP inválido, dados preenchidos" do
    address = Address.new(cep: '999999999', uf: 'DF', city: 'Brasilia', district: 'Asa Sul', address: 'SQS 313')
    assert_not address.save
   end
end
