# spec/support/factories/role_factories.rb

FactoryGirl.define do
  factory :role do
    sequence(:company) { |index| "Company #{index}" }
    sequence(:title) { |index| "Title #{index}" }
  end # factory
end # define
