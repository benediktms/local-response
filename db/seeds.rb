# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
Chatroom.destroy_all
Booking.destroy_all
Job.destroy_all
User.destroy_all
Category.destroy_all

puts 'creating users...'
bob =
  User.create!(
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

sam =
  User.create!(
    {
      first_name: 'Sam',
      last_name: 'Smith',
      address: '10 Whiston Rd, London E2 8FX',
      email: 'sam@me.com',
      password: 'secure_pass5!',
      password_confirmation: 'secure_pass5!'
    }
  )
puts "created #{sam}"

theresa =
  User.create!(
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

margaret =
  User.create!(
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

boris =
  User.create!(
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

david =
  User.create!(
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

keanu =
  User.create!(
    {
      first_name: 'Keanu',
      last_name: 'Reeves',
      address: '2 Downham Rd, Dalston, London N1 5FR',
      email: 'keanu@me.com',
      password: 'secure_pass5!',
      password_confirmation: 'secure_pass5!'
    }
  )

puts 'creating categories...'
groceries = Category.create!({ name: 'Groceries' })
puts "created #{groceries}"

medicine = Category.create!({ name: 'Medicine' })
puts "created #{medicine}"

chores = Category.create!({ name: 'Chores' })
puts "created #{chores}"

other = Category.create!({ name: 'Other' })
puts "created #{other}"

puts 'creating jobs...'
job1 =
  Job.create!(
    title: 'Please, help me do the groceries',
    description:
      "I've had a sever lung infection and was advised not to leave my house. I usually get my groceries delivered, but unfortunatley there weren't any solts until next week. Would really appreciate some help getting the essentials until then",
    address: '125 Kingsway London WC2B 6NH',
    due_date: Time.now + 259_200,
    category: groceries,
    user: bob
  )
puts "created #{job1}"

job2 =
  Job.create!(
    {
      title: 'I need some help getting my prescription',
      description:
        "I've recently returned from abroad and need to stay in self isolation for the next two weeks. My GP informed me that there are some prescription drugs at my pharmacy. I'd appreciate if someone could go and grab them for me please.",
      address: '21 Soho Square London W1D 3QP',
      due_date: Time.now + 259_200,
      category: medicine,
      user: boris
    }
  )
puts "created #{job2}"

job3 =
  Job.create!(
    {
      title: 'Need some help fixing my roof',
      description:
        "I've recently taken a bit of a fall and broke my leg. I've been putting off fixing a leak in my roof, but Winter is coming and I really do need to get it sorted. If anyone could help me out I'd me much oblilged.",
      address: '38 Chancery Lane London WC2A 1EN',
      due_date: Time.now + 259_200,
      category: chores,
      user: david
    }
  )
puts "created #{job3}"

job4 =
  Job.create!(
    {
      title: 'Need medecine for heart condition',
      description:
        'I suffer from a heart condition and have been advised to self-isolate until the COVID-19 situation has calmed down a bit. However, I still need my medicine for my heart condition. Could someone run to the pharmacy and get it for me please?',
      address: '71 Aldwych London WC2B 4HN',
      due_date: Time.now + 259_200,
      category: medicine,
      user: theresa
    }
  )
puts "created #{job4}"

job5 =
  Job.create!(
    {
      title: 'Two senior citizens need assitance with some essentials',
      description:
        'Me and my wife are both in our late 80s and have been advised to stay inside until the COVID-10 situation has been handled. My son and his wife are coming to stay with us next week, but until then we woudl need some help getting the essentials.',
      address: '2 Sheraton Street London W1F 8BH',
      due_date: Time.now + 259_200,
      category: groceries,
      user: boris
    }
  )
puts "created #{job5}"

job6 =
  Job.create!(
    {
      title: 'Need to return some books to the library',
      description:
        "I'm a single dad and my boy is sick (nothing serious, he's just go chickenpox!). Usually I've got a friend to help me out, but she's gone to stay with her family for the next few weeks. I really need to go return some books to the library. Could some bring them back for me, please?",
      address: '109 Borough High Street London SE1 1NL',
      due_date: Time.now + 259_200,
      category: chores,
      user: david
    }
  )
puts "created #{job6}"

job7 =
  Job.create!(
    {
      title: "I've broken my arm and need some help fixing the sink",
      description:
        "I fell the other day and broke my arm. My sink has developed a leak so I really need to fix it. Unfortunatly in my current situation I can't do that, but it's really quite simple, I can talk you through it! I'll also throw in a free meal!",
      address: '1 Long Lane, London SE1 4PG',
      due_date: Time.now + 259_200,
      category: chores,
      user: bob
    }
  )
puts "created #{job7}"

job8 =
  Job.create!(
    {
      title: 'Need someone to collect my brother from the airport',
      description:
        "My brother's coming to stay with me for a few weeks. Unfortunatley, he doesn't speak english very well and I'm worried that he's going to get lost. Please could someone get him from the airport for me?",
      address: '35 Little Russell Street London WC1A 2HH',
      due_date: Time.now + 259_200,
      category: other,
      user: margaret
    }
  )
puts "created #{job8}"

job9 =
  Job.create!(
    {
      title: 'Need someone to take care of my dog while I am in hospital.',
      description:
        "I've been diagnosed with COVID-19 and have been hospitalized for at least two weeks. My poor dog is all alone at home. Please coudl someone look after her while I'm in hospital?",
      address: 'Ingestre Place London W1F 0JL',
      due_date: Time.now + 259_200,
      category: other,
      user: david
    }
  )
puts "created #{job9}"

job10 =
  Job.create!(
    {
      title: 'Pollen allergy must stay in',
      description:
        "I've got a really bad pollen allergy to the point where my I can't breateh. Usualyl it's not a problem as I have medicine for it, but it's quite a rare condition and with the pandemic going on they have delayed production in favor of producting ventilators... I can't risk leaving the house, but I really need to get soem essntials in. Coudl someone run to the shop and pick up a few thigns for me, please?",
      address: '123 Buckingham Palace Road London SW1W 9SH',
      due_date: Time.now + 259_200,
      category: groceries,
      user: margaret
    }
  )
puts "created #{job10}"

puts 'Populating local area...'

job11 =
  Job.create!(
    {
      title: 'Need some things collected from the office',
      description:
        "I'm a bit ill at the moment but I really need to colelct some things from the office. Could someone help me please? Don't worry it's nothing heavy, and it'll fit into a backpack.",
      address: 'Queensbridge Rd, London E8 3ND',
      due_date: Time.now + 259_200,
      category: other,
      user: bob
    }
  )
puts "created #{job11}"

job12 =
  Job.create!(
    {
      title: 'Need to get some medicien from the pharmacy',
      description:
        "I've been told to self isolate by my son (he worries a lot). I promised him that I wouldn't leave the house, but I need to grab my perscription and he's very busy at work and I don't want to put him under more pressure. Please could someone pop down to the pharmacy and grab my meds for me?",
      address: '253 Kingsland Rd, London E2 8AN',
      due_date: Time.now + 259_200,
      category: medicine,
      user: david
    }
  )
puts "created #{job12}"

job13 =
  Job.create!(
    {
      title: 'Need someone to walk my dog',
      description:
        "I've been told to shield during the COVID-19 pandemic,, but I really need someone to look after my dog. This is just a one off until I find a permanent solution. My old buy doesn't need long (30 mins along the canal should be enough). He's a kind soul and very easy to take care of. If anyone is available to help me, please get in touch.",
      address: '43 De Beauvoir Rd, De Beauvoir Town, London N1 5SQ',
      due_date: Time.now + 259_200,
      category: chores,
      user: theresa
    }
  )
puts "created #{job13}"

job14 =
  Job.create!(
    {
      title: 'Please, I need some coffe!',
      description:
        "Hi there! I'm a bit of a pickle! I've been told to self isolate, and have doen a big shop to prepare, but I've realized that I completly forgot to stock up on coffee! I'm a software developer and I won't be able to do my job wihtout coffee. Please can somone get me some coffee!!",
      address: 'Northchurch Terrace, London N1 4DA',
      due_date: Time.now + 259_200,
      category: groceries,
      user: margaret
    }
  )
puts "created #{job14}"

puts 'creating bookings...'

booking1 =
  Booking.create!(
    job: job11, user: keanu, confirmed: false, completed: false, declined: false
  )
Chatroom.create!({ booking: booking1, name: booking1.job.title })
puts "created #{booking1}"

booking2 =
  Booking.create!(
    {
      job: job12,
      user: keanu,
      confirmed: false,
      completed: false,
      declined: false
    }
  )
Chatroom.create!({ booking: booking2, name: booking2.job.title })
puts "created #{booking2}"

booking3 =
  Booking.create!(
    {
      job: job13,
      user: keanu,
      confirmed: false,
      completed: false,
      declined: false
    }
  )
Chatroom.create!({ booking: booking3, name: booking3.job.title })
puts "created #{booking3}"

booking4 =
  Booking.create!(
    {
      job: job14,
      user: keanu,
      confirmed: false,
      completed: false,
      declined: false
    }
  )
Chatroom.create!({ booking: booking4, name: booking4.job.title })
puts "created #{booking4}"

# booking5 =
#   Booking.create!(
#     {
#       job: job2,
#       user: theresa,
#       confirmed: false,
#       completed: false,
#       declined: false
#     }
#   )
# Chatroom.create!({ booking: booking5, name: booking5.job.title })
# puts "created #{booking4}"

# booking6 =
#   Booking.create!(
#     {
#       job: job2,
#       user: margaret,
#       confirmed: false,
#       completed: false,
#       declined: false
#     }
#   )
# Chatroom.create!({ booking: booking6, name: booking6.job.title })
# puts "created #{booking6}"

# booking7 =
#   Booking.create!(
#     {
#       job: job3, user: bob, confirmed: false, completed: false, declined: false
#     }
#   )
# Chatroom.create!({ booking: booking7, name: booking7.job.title })
# puts "created #{booking7}"

# booking8 =
#   Booking.create!(
#     {
#       job: job3,
#       user: margaret,
#       confirmed: false,
#       completed: false,
#       declined: false
#     }
#   )
# Chatroom.create!({ booking: booking8, name: booking8.job.title })
# puts "created #{booking8}"

# booking9 =
#   Booking.create!(
#     {
#       job: job3,
#       user: boris,
#       confirmed: false,
#       completed: false,
#       declined: false
#     }
#   )
# Chatroom.create!({ booking: booking9, name: booking9.job.title })
# puts "created #{booking9}"

# booking10 =
#   Booking.create!(
#     {
#       job: job4, user: bob, confirmed: false, completed: false, declined: false
#     }
#   )
# Chatroom.create!({ booking: booking10, name: booking10.job.title })
# puts "created #{booking10}"

# booking11 =
#   Booking.create!(
#     {
#       job: job5, user: sam, confirmed: false, completed: false, declined: false
#     }
#   )
# Chatroom.create!({ booking: booking11, name: booking11.job.title })
# puts "created #{booking11}"

# booking12 =
#   Booking.create!(
#     {
#       job: job6,
#       user: theresa,
#       confirmed: false,
#       completed: false,
#       declined: false
#     }
#   )
# Chatroom.create!({ booking: booking12, name: booking12.job.title })
# puts "created #{booking12}"

# booking13 =
#   Booking.create!(
#     {
#       job: job7,
#       user: margaret,
#       confirmed: true,
#       completed: false,
#       declined: false
#     }
#   )
# Chatroom.create!({ booking: booking13, name: booking13.job.title })
# puts "created #{booking13}"

# booking14 =
#   Booking.create!(
#     {
#       job: job8, user: boris, confirmed: true, completed: true, declined: false
#     }
#   )
# Chatroom.create!({ booking: booking14, name: booking14.job.title })
# puts "created #{booking14}"

# booking15 =
#   Booking.create!(
#     { job: job9, user: bob, confirmed: true, completed: false, declined: false }
#   )
# Chatroom.create!({ booking: booking15, name: booking15.job.title })
# puts "created #{booking15}"

# booking16 =
#   Booking.create!(
#     { job: job10, user: bob, confirmed: true, completed: true, declined: false }
#   )
# Chatroom.create!({ booking: booking16, name: booking16.job.title })
# puts "created #{booking16}"
