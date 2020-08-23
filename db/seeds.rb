# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'creating users...'
bob = User.create(
  {
    first_name: 'Bob',
    last_name: 'Jones',
    address: '123 Alphabet Road',
    email: 'bob@me.com',
    password: 'secure_pass5!',
    password_confirmation: 'secure_pass5!'
  }
)
puts "created #{bob}"

sam = User.create(
  {
    first_name: 'Sam',
    last_name: 'Smith',
    address: '47 Musical Road',
    email: 'sam@me.com',
    password: 'secure_pass5!',
    password_confirmation: 'secure_pass5!'
  }
)
puts "created #{sam}"

puts 'creating categories...'
groceries = Category.create(
  {
    name: 'Groceries'
  }
)
puts "created #{groceries}"

medicine = Category.create(
  {
    name: 'Medicine'
  }
)
puts "created #{medicine}"

puts 'creating jobs...'
job1 = Job.create(
  {
    title: 'Need groceries',
    description: 'food pls',
    due_date: 2020-11-26,
    category_id: 1,
    user_id: 1
  }
)
puts "created #{job1}"

job2 = Job.create(
  {
    title: 'Need medicien',
    description: 'medicine pls',
    due_date: 2020-11-27,
    category_id: 2,
    user_id: 1
  }
)
puts "created #{job2}"

puts 'creating bookings...'
booking1 = Booking.create(
  {
    user_id: 2,
    job_id: 1,
    confirmed: false,
    completed: false
  }
)
puts "created #{booking1}"

booking2 = Booking.create(
  {
    user_id: 2,
    job_id: 2,
    confirmed: true,
    completed: false
  }
)
puts "created #{booking2}"
