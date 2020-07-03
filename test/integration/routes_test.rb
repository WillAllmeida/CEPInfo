require 'test_helper'

class RoutesTest < ActionController::TestCase
    test "Rota de visualização de CEPs" do
        assert_recognizes({controller: 'api/addresses', action: 'index'}, {path: 'api/addresses', method: :get})
    end

    test "Rota de cadastramento de CEPs" do
        assert_recognizes({controller: 'api/addresses', action: 'create'}, {path: 'api/addresses', method: :post})
    end

    test "Rota de autenticação" do
        assert_recognizes({controller: 'authentication', action: 'authenticate'}, {path: 'authenticate', method: :post})
    end
  end