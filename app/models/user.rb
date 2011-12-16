require 'bcrypt'
require 'rufus-scheduler'

class User < ActiveRecord::Base

  @@scheduler = Rufus::Scheduler.start_new
  @@admin_status = {0 => 'No', 1 => 'Yes'}

  include BCrypt
  
  belongs_to :institution

  after_initialize :initialize_defaults

  validates_presence_of :username
  validates_uniqueness_of :username, :scope => [:institution_id]
  validates_numericality_of :admin, :only_integer => true
  validate :presence_of_password
  validate :email_is_valid
  validate :admin_has_legal_value

  def admin_has_legal_value
    errors.add(:admin, 'must be 0 or 1' ) if not [0, 1].include? admin
  end

  def email_is_valid
    # This regex is from http://www.regular-expressions.info/email.html, read there for more information
    re = Regexp.new("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$", Regexp::IGNORECASE)
    errors.add(:email, 'must be a valid email' ) if not re.match email
  end

  def presence_of_password
    errors[:base] << ("Password can't be blank") if password_hash.blank? or password.nil? or password == ""
  end

  def admin_in_words
    return @@admin_status[admin]
  end

  def initialize_defaults
    if new_record?
      self.admin = 0 if self.admin.blank?
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def send_reset_password_email
    self.password_reset_token = ActionController::HttpAuthentication::Digest.nonce(password_hash, Time.now)[1,20]
    self.token_expiration = Time.now.advance(:hours => 24)
    self.save!
    @@scheduler.in '1s' do
      begin
        UserMailer.password_reset_email(self).deliver
      rescue Net::SMTPError
        self.token_expiration = Time.now
        self.save!
        return false
      end
    end
    return true
  end

end