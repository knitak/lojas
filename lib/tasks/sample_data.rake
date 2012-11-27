namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Shop.create!(name: "Loja",
                 address: "Rua",
                 postalcode: "0000-000")
    99.times do |n|
      name  = Faker::Name.name
      address = "Rua #{n+1}"
      postalcode  = "0000-0#{n+1}"
      Shop.create!(name: name,
                   address: address,
                   postalcode: postalcode)
    end
  end
end