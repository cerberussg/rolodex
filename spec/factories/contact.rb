FactoryBot.define do

  factory :contact do
    name { "#{Faker::Name.name}" }
    email { "#{Faker::Internet.email}" }
    company { "#{Faker::Company.name}" }
    phone { "#{Faker::PhoneNumber.cell_phone}" }
    address { "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}" }
    group_id { Group.create(name: "Family").id }
  end
end
