module Astrochimp
  class Signup < ActiveRecord::Base
    # Attributes
    attr_accessible :email

    # Constants
    STATUS_NEW = 0
    STATUS_SUBSCRIBED = 1
    STATUS_INVITED = 2

    # Validations
    validates :email, uniqueness: true, email: true

    # Callbacks
    before_create :add_email_to_mailchimp

    private
    def add_email_to_mailchimp
      # Handle any MailChimp errors
      begin
        h = ::Hominid::API.new(ENV['AC_MAILCHIMP_API_KEY'], { secure: true, timeout: 60 })
        h.list_subscribe(ENV['AC_MAILCHIMP_LIST_ID'], email, {}, ENV['AC_EMAIL_FORMAT'], ENV['AC_EMAIL_DOUBLE_OPTIN'])
        status = STATUS_SUBSCRIBED
      rescue => e
        errors.add(:base, I18n.t("activerecord.errors.models.signup.attributes.base.mailchimp_api_error", message: e.message))
        false
      end
    end
  end
end
