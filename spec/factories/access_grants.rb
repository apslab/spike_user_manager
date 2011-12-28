# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :access_grant do
      code "MyString"
      access_token "MyString"
      refresh_token "MyString"
      access_token_expires_at "2011-12-27 10:59:28"
      application_id 1
    end
end