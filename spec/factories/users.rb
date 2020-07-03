FactoryGirl.define do
    factory :user, class: User do
      email "admin@test.com"
      password "123456"
      password_confirmation "123456"
    end
  end