class Mailer < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.contact.subject
  #
  def contact
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
