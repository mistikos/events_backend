class AdminMailer < ActionMailer::Base
  default from: 'notifications@example.com'
  def welcome(admin, password)
    @admin = admin
    @password = password
    @url = root_url
    mail(to: admin.email, subject: 'Welcome to Events Site')
  end
end