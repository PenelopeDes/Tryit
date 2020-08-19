# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'date'

Faker::Config.locale = :fr

Car.destroy_all
User.destroy_all
Booking.destroy_all

categories = ["Family", "Sports", "Urban", "Vintage", "Exotic"]

categories.each do |category|

3.times do

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = "#{first_name.gsub(/\s+/, "").downcase}_#{last_name.gsub(/\s+/, "").downcase}"

  p user = User.new(
    first_name: first_name || 'jean',
    last_name: last_name || 'michel',
    username: user_name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: "#{first_name.gsub(/\s+/, "").downcase}.#{last_name.gsub(/\s+/, "").downcase}@gmail.com",
    password: '123456'
  )

  file = URI.open(Faker::Avatar.image)

  user.photo.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')
  user.save!

  brand = Faker::Vehicle.make

  p car = Car.new(
      category: category,
      brand: brand,
      model: Faker::Vehicle.model(make_of_model: brand),
      motorizing: Faker::Vehicle.engine,
      description:Faker::Vehicle.standard_specs.join(" | "),
      address: Faker::Address.full_address,
      start_date: Date.new,
      end_date: Faker::Date.forward(days: 23),
      user_id: user.id
  )

  file_car1 = URI.open('https://source.unsplash.com/800x450/?car')
  car.photos.attach(io: file_car1, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car2 = URI.open('https://source.unsplash.com/800x450/?auto')
  car.photos.attach(io: file_car2, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car3 = URI.open('https://source.unsplash.com/800x450/?voiture')
  car.photos.attach(io: file_car3, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car4 = URI.open('https://source.unsplash.com/800x450/?road')
  car.photos.attach(io: file_car4, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car5 = URI.open('https://source.unsplash.com/800x450/?garage')
  car.photos.attach(io: file_car5, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!
end
end
