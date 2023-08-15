namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    kinds = %W(friend family job)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )  
    end
    
    100.times do |i|
      contact = Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 40.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
      
      Random.rand(5).times do |i|
        contact.phones.build(phone_number: Faker::PhoneNumber.cell_phone)
      end
      
      contact.save!
    end
  end
end
