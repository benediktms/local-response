# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bob = User.create({first_name: 'Bob', last_name: 'Jones', address: '123 Alphabet Road', email: 'bob@me.com'})
sam = User.create({first_name: 'Sam', last_name: 'Smith', address: '47 Musical Road', email: 'sam@me.com'})

job1 = Job.create({title: 'Need groceries', description: 'food pls', user_id: 1})

booking1 = Booking.create({user_id: 2, job_id: 1})
