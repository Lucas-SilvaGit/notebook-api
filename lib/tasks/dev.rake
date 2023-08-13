namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 40.years.ago, to: 18.years.ago),
        phone_number: Faker::PhoneNumber.cell_phone,
        group: Faker::Lorem.word
      )
    end
  end
end
