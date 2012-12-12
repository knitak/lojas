namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Shop.create!(name: "Loja",
                 address: "Rua",
                 postalcode: "0000-000",
                 category: "Food",
                 city: "Lisboa")
    99.times do |n|
      name  = Faker::Name.name
      address = "Rua #{n+1}"
      postalcode  = "0000-0#{n+1}"
      category = "Food"
      city = "Lisboa"
      Shop.create!(name: name,
                   address: address,
                   postalcode: postalcode,
                   category: category,
                   city: Lisboa)
    end
  end
end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Category.create!(category: "Food")
    20.times do |n|
      category  = "Categoria #{n+1}"
      Category.create!(category: category)
    end
  end
end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    City.create!(city: "Lisboa")
    20.times do |n|
      city  = "Cidade #{n+1}"
      City.create!(city: city)
    end
  end
end