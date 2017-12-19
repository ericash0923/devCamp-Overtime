AdminUser.create(email: "myadmin@admin.com", password: "asdfasdf", 
                         password_confirmation: "asdfasdf",
                         first_name: "Admin",
                         last_name: "User",
                         phone: "3473300776")

puts "1 admin created"

@user = User.create(email: "test@test.com", password: "asdfasdf", 
                         password_confirmation: "asdfasdf",
                         first_name: "John",
                         last_name: "Smith",
                         phone: "3473300776")

puts "1 user created"


100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
              user_id: @user.id, overtime_request: 2.5)
end

puts "100 post have been created"

100.times do |audit_log|
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs have been created"