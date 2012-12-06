module Astrochimp
  class Signup < ActiveRecord::Base
    # Attributes
    attr_accessible :email

    # Constants
    STATUS_NEW = 0
    STATUS_SUBSCRIBED = 1
    STATUS_INVITED = 2

    # Relations
    has_many :referrals, class_name: 'Signup'
    belongs_to :referrer, class_name: 'Signup', counter_cache: true

    # Validations
    validates :email, uniqueness: true, email: true

    # Callbacks
    before_create :add_email_to_mailchimp

    # Include referral_id functionality
    include IdCode
    alias :referral_code :id_code

    # Return the referral code instead of id for urls
    alias :to_param :referral_code

    def self.find(id_or_code)
      if id_or_code.is_a? Integer
        super(id_or_code)
      else
        find_by_id_code(id_or_code)
      end
    end

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
