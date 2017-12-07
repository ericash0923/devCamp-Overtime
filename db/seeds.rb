@user = User.create(email: "test@test.com", password: "asdfasdf", 
                         password_confirmation: "asdfasdf",
                         first_name: "John",
                         last_name: "Smith")

puts "1 user created"

AdminUser.create(email: "myadmin@admin.com", password: "asdfasdf", 
                         password_confirmation: "asdfasdf",
                         first_name: "Admin",
                         last_name: "User")

puts "1 admin created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 post have been created"