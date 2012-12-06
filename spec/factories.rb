FactoryGirl.define do
  factory :shop do
    sequence(:name)  { |n| "Loja #{n}" }
    sequence(:address)  { |n| "Rua #{n}" }
    postalcode "0000-000"
    category "Food"
  end

  factory :category do
    content "Food"
    shop
  end
end