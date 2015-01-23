# Create an admin user
admin = User.new(
   screen_name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   # role:     'premium'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
   screen_name:     'Moderator User',
   email:    'moderator@example.com', 
   password: 'helloworld',
   # role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
   screen_name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
