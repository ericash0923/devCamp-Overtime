@user = User.create(email: "test@test.com", password: "asdfasdf", 
                         password_confirmation: "asdfasdf",
                         first_name: "John",
                         last_name: "Smith",
                         phone: "3473300776")

puts "1 user created"

AdminUser.create(email: "myadmin@admin.com", password: "asdfasdf", 
                         password_confirmation: "asdfasdf",
                         first_name: "Admin",
                         last_name: "User",
                         phone: "3473300776")

puts "1 admin created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 post have been created"