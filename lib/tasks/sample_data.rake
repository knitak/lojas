namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Shop.create!(name: "Loja",
                 address: "Rua",
                 postalcode: "0000-000",
                 category: "Food")
    99.times do |n|
      name  = Faker::Name.name
      address = "Rua #{n+1}"
      postalcode  = "0000-0#{n+1}"
      category = "Food"
      Shop.create!(name: name,
                   address: address,
                   postalcode: postalcode,
                   category: category)
    end
  end
end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Category.create!(category: "Food")
    99.times do |n|
      category  = "Categoria #{n+1}"
      Category.create!(category: category)
    end
  end
end