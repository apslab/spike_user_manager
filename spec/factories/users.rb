# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name  'John'
    last_name   'Doe'
    email       { "#{first_name}.#{last_name}@testmail.com".downcase }
    password    'password'
  end
end
