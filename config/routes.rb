Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do	
  		resources :addresses
  end
  post 'authenticate', to: 'authentication#authenticate'
end

