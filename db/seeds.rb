# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subscription.destroy_all
Customer.destroy_all
Tea.destroy_all

@customer1 = Customer.create!(first_name: "Frank", last_name: "West", email: "zombiehunter@gmail.com", address: "2361 S. Garland Ct.")

@tea1 = Tea.create!(title: "Big Tea", description: "The big tired", temperature: "Big Hot", brew_time: "Not that long")
@tea2 = Tea.create!(title: "Small Tea", description: "The small tired", temperature: "Small Hot", brew_time: "Long")
@tea3 = Tea.create!(title: "The Tea", description: "tired", temperature: "Hot", brew_time: "short")

@subscription1 = Subscription.create!(title: "The big one", price: 420.69, status: 0, frequency: "All the time", customer_id: @customer1.id, tea_id: @tea1.id)
@subscription2 = Subscription.create!(title: "The small one", price: 69.42, status: 1, frequency: "All the time", customer_id: @customer1.id, tea_id: @tea2.id)

