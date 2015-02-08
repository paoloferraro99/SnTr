# Create an admin user
admin = User.new(
   screen_name:   'Admin User',
   email:         'admin@example.com',
   password:      'helloworld',
   # role:     'premium'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
   screen_name:   'Moderator User',
   email:         'moderator@example.com', 
   password:      'helloworld',
   # role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
   screen_name:   'Member User',
   email:         'member@example.com',
   password:      'helloworld',
)
member.skip_confirmation!
member.save!

##############################################

miki = User.new(
   screen_name:   'Miki',
   email:         'miki@example.com',
   password:      'helloworld',
)
miki.skip_confirmation!
miki.save!

andrew = User.new(
   screen_name:   'Andrew',
   email:         'andrew@example.com',
   password:      'helloworld',
)
andrew.skip_confirmation!
andrew.save!

###############################################

israel = Destination.new(
   name:          'A',
   region:        'Middle East',
   country:       'Israel',

   individual_price: 10,
   chronological_order: 1,
)
israel.save!

america = Destination.new(
   name:          'B',
   region:        'North America',
   country:       'United States',

   individual_price: 10,
   chronological_order: 2,
)
america.save!

bulgaria = Destination.new(
   name:          'C',
   region:        'Europe Southeastern',
   country:       'United States',

   individual_price: 10,
   chronological_order: 3,
)
bulgaria.save!

colombia = Destination.new(
   name:          'D',
   region:        'South America',
   country:       'Colombia',

   individual_price: 10,
   chronological_order: 4,
)
colombia.save!

denmark = Destination.new(
   name:          'E',
   region:        'Europe Northern',
   country:       'United States',

   individual_price: 10,
   chronological_order: 5,
)
denmark.save!

ethiopia = Destination.new(
   name:          'F',
   region:        'Africa',
   country:       'Ethiopia',

   individual_price: 10,
   chronological_order: 6,
)
ethiopia.save!

france = Destination.new(
   name:          'G',
   region:        'Europe Western',
   country:       'France',

   individual_price: 10,
   chronological_order: 7,
)
france.save!

greatbritain = Destination.new(
   name:          'H',
   region:        'Europe Western',
   country:       'United Kingdom',

   individual_price: 10,
   chronological_order: 8,
)
greatbritain.save!
holland = Destination.new(
   name:          'I',
   region:        'Europe Western',
   country:       'Netherlands',

   individual_price: 10,
   chronological_order: 9,
)
holland.save!
iceland = Destination.new(
   name:          'J',
   region:        'Europe Western',
   country:       'Iceland',

   individual_price: 10,
   chronological_order: 10,
)
iceland.save!
japan = Destination.new(
   name:          'K',
   region:        'Asia East',
   country:       'Japan',

   individual_price: 10,
   chronological_order: 11,
)
japan.save!
korea = Destination.new(
   name:          'L',
   region:        'Asia East',
   country:       'Korea',

   individual_price: 10,
   chronological_order: 12,
)
korea.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Destination.count} destinations created"
