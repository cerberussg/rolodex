# frozen_string_literal: true

Contact.destroy_all
Group.destroy_all
User.destroy_all

user_ids = []
user_ids << User.create(
  name: 'John Doe',
  email: 'johndoe@text.com',
  password: 'secret'
).id

user_ids << User.create(
  name: 'Jane Roe',
  email: 'janeroe@text.com',
  password: 'secret'
).id

p "#{user_ids.count} Users created"

group_ids = { user_ids[0] => [], user_ids[1] => [] }

group_ids[user_ids[0]] << Group.create(name: 'Client', user_id: user_ids[0]).id
group_ids[user_ids[0]] << Group.create(name: 'Family', user_id: user_ids[0]).id
group_ids[user_ids[1]] << Group.create(name: 'Friend', user_id: user_ids[1]).id
group_ids[user_ids[1]] << Group.create(name: 'Work', user_id: user_ids[1]).id

p "#{group_ids.count} Groups created"

group_count = group_ids.length
number_of_contacts = 60
contacts = []

number_of_contacts.times do |i|
  user_id = user_ids[Random.rand(0...2)]

  new_contact = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    company: Faker::Company.name,
    phone: Faker::PhoneNumber.cell_phone,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}",
    group_id: group_ids[user_id][Random.rand(0...group_count)],
    user_id: user_id
  }
  contacts.push(new_contact)
end

Contact.create(contacts)

p "#{number_of_contacts} Contacts created."
