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
   name:          'Israel: Cherry Breaking',
   region:        'Middle East',
   country:       'Israel',

   chronological_order: 1,
)
israel.save!

america = Destination.new(
   name:          'America: Never Like the First Time',
   region:        'North America',
   country:       'United States',

   chronological_order: 2,
)
america.save!

bulgaria = Destination.new(
   name:          'Bulgaria: Tripe Soup',
   region:        'Europe Southeastern',
   country:       'United States',

   chronological_order: 3,
)
bulgaria.save!

colombia = Destination.new(
   name:          'Colombia: Arepa and Chorizo',
   region:        'South America',
   country:       'Colombia',

   chronological_order: 4,
)
colombia.save!

denmark = Destination.new(
   name:          'Denmark: Meat an Fish',
   region:        'Europe Northern',
   country:       'United States',

   chronological_order: 5,
)
denmark.save!

ethiopia = Destination.new(
   name:          'Ethiopia: Injera',
   region:        'Africa',
   country:       'Ethiopia',

   chronological_order: 6,
)
ethiopia.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Destination.count} destinations created"
