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
    address: '125 Kingsway London WC2B 6NH',
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
    address: '21 Soho Square London W1D 3QP',
    email: 'sam@me.com',
    password: 'secure_pass5!',
    password_confirmation: 'secure_pass5!'
  }
)
puts "created #{sam}"

theresa = User.create(
  {
    first_name: 'Theresa',
    last_name: 'Mee',
    address: '38 Chancery Lane London WC2A 1EN',
    email: 'theresa@me.com',
    password: 'secure_pass5!',
    password_confirmation: 'secure_pass5!'
  }
)
puts "created #{theresa}"

margaret = User.create(
  {
    first_name: 'Margaret',
    last_name: 'That',
    address: '71 Aldwych London WC2B 4HN',
    email: 'margaret@me.com',
    password: 'secure_pass5!',
    password_confirmation: 'secure_pass5!'
  }
)
puts "created #{margaret}"

boris = User.create(
  {
    first_name: 'Boris',
    last_name: 'John',
    address: '2 Sheraton Street London W1F 8BH',
    email: 'boris@me.com',
    password: 'secure_pass5!',
    password_confirmation: 'secure_pass5!'
  }
)
puts "created #{boris}"

david = User.create(
  {
    first_name: 'David',
    last_name: 'Cam',
    address: '109 Borough High Street London SE1 1NL',
    email: 'david@me.com',
    password: 'secure_pass5!',
    password_confirmation: 'secure_pass5!'
  }
)
puts "created #{david}"

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


other = Category.create(
  {
    name: 'Other'
  }
)
puts "created #{other}"


puts 'creating jobs...'
job1 = Job.create(
  {
    title: 'Need groceries',
    description: 'I am self-isolating',
    address: '125 Kingsway London WC2B 6NH',
    due_date: Time.now + 259_200,
    category_id: 1,
    user_id: 1
  }
)
puts "created #{job1}"

job2 = Job.create(
  {
    title: 'Need medicine',
    description: 'Medicine please',
    address: '21 Soho Square London W1D 3QP',
    due_date: Time.now + 259_200,
    category_id: 2,
    user_id: 2
  }
)
puts "created #{job2}"

job3 = Job.create(
  {
    title: 'Vulnerable person',
    description: 'I need someone to pick up heart pills at pharmancy',
    address: '38 Chancery Lane London WC2A 1EN',
    due_date: Time.now + 259_200,
    category_id: 2,
    user_id: 3
  }
)
puts "created #{job3}"

job4 = Job.create(
  {
    title: 'Need medecine for heart condition',
    description: 'Medicine please',
    address: '71 Aldwych London WC2B 4HN',
    due_date: Time.now + 259_200,
    category_id: 2,
    user_id: 4
  }
)
puts "created #{job4}"

job5 = Job.create(
  {
    title: 'Old couple',
    description: 'Can you pick up groceries for us?',
    address: '2 Sheraton Street London W1F 8BH',
    due_date: Time.now + 259_200,
    category_id: 1,
    user_id: 5
  }
)
puts "created #{job4}"

job6 = Job.create(
  {
    title: 'Single parent ... cannot leave flat',
    description: 'Need someone to help',
    address: '109 Borough High Street London SE1 1NL',
    due_date: Time.now + 259_200,
    category_id: 3,
    user_id: 6
  }
)
puts "created #{job6}"

job7 = Job.create(
  {
    title: 'Broken leg, cannot move',
    description: 'Need someone to help',
    address: '1 Long Lane, London SE1 4PG',
    due_date: Time.now + 259_200,
    category_id: 1,
    user_id: 1
  }
)
puts "created #{job7}"

job8 = Job.create(
  {
    title: 'Affected by severe stomach bug',
    description: 'Can you bring medecine ?',
    address: '35 Little Russell Street London WC1A 2HH',
    due_date: Time.now + 259_200,
    category_id: 2,
    user_id: 1
  }
)
puts "created #{job8}"

job9 = Job.create(
  {
    title: 'Have the flu',
    description: 'Need someone to go to supermarket',
    address:'Ingestre Place London W1F 0JL',
    due_date: Time.now + 259_200,
    category_id: 1,
    user_id: 5
  }
)
puts "created #{job9}"

job10 = Job.create(
  {
    title: 'Pollen allergy must stay in',
    description: 'Need someone to help',
    address: '123 Buckingham Palace Road London SW1W 9SH',
    due_date: Time.now + 259_200,
    category_id: 3,
    user_id: 6
  }
)
puts "created #{job10}"

puts 'creating bookings...'

booking1 = Booking.create(
  {
    job_id: 1,
    user_id: 3,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking1}"

booking2 = Booking.create(
  {
    job_id: 1,
    user_id: 5,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking2}"

booking3 = Booking.create(
  {
    job_id: 1,
    user_id: 6,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking3}"

booking4 = Booking.create(
  {
    job_id: 2,
    user_id: 1,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking4}"

booking5 = Booking.create(
  {
    job_id: 2,
    user_id: 3,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking4}"

booking6 = Booking.create(
  {
    job_id: 2,
    user_id: 4,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking6}"

booking7 = Booking.create(
  {
    job_id: 3,
    user_id: 1,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking7}"

booking8 = Booking.create(
  {
    job_id: 3,
    user_id: 4,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking8}"

booking9 = Booking.create(
  {
    job_id: 3,
    user_id: 5,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking9}"

booking10 = Booking.create(
  {
    job_id: 4,
    user_id: 1,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking10}"

booking11 = Booking.create(
  {
    job_id: 5,
    user_id: 2,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking11}"

booking12 = Booking.create(
  {
    job_id: 6,
    user_id: 3,
    confirmed: false,
    completed: false,
    declined: false
  }
)
puts "created #{booking12}"

booking13 = Booking.create(
  {
    job_id: 7,
    user_id: 4,
    confirmed: true,
    completed: false,
    declined: false
  }
)
puts "created #{booking13}"

booking14 = Booking.create(
  {
    job_id: 8,
    user_id: 5,
    confirmed: true,
    completed: true,
    declined: false
  }
)
puts "created #{booking14}"

booking15 = Booking.create(
  {
    job_id: 9,
    user_id: 1,
    confirmed: true,
    completed: false,
    declined: false
  }
)
puts "created #{booking15}"

booking16 = Booking.create(
  {
    job_id: 10,
    user_id: 1,
    confirmed: true,
    completed: true,
    declined: false
  }
)
puts "created #{booking16}"