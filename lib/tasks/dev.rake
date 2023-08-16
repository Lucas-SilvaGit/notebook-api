namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    
    puts "Registering contact types..."

    kinds = %w(Friend Family Job)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Types Contact successfully registered!"

    ######################

    puts "Registering contacts..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Successfully registered contacts!"

    ######################

    puts "Registering phones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(phone_number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Phones successfully registered!"

    ######################

    puts "Entering addresses..."

    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Addresses successfully registered!"
  end
end
