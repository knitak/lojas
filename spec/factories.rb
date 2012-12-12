FactoryGirl.define do
  factory :shop do
    sequence(:name)  { |n| "Loja #{n}" }
    sequence(:address)  { |n| "Rua #{n}" }
    postalcode "0000-000"
    category "Food"
  end

  factory :category do
    category "Food"
    shop
  end

  factory :city do
    city "Lisboa"
    shop
  end
end