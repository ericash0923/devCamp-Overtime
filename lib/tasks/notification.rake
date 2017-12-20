namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the overtime management dashboard to request overtime or your hours for last week: https://dev-overtime.herokuapp.com"
      
      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    # end
  end

  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime request"
  task manager_email: :environment do
    submitted_post = Post.submitted
    admin_users = AdminUser.all
    
    if submitted_post.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end

