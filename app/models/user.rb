require 'bcrypt'

class User < ActiveRecord::Base

  @@admin_status = {0 => 'No', 1 => 'Yes'}

  include BCrypt
  
  belongs_to :institution

  validates_presence_of :email, :username
  validates_uniqueness_of :username, :scope => [:institution_id]
  validates_numericality_of :admin, :only_integer => true
  validate :presence_of_password
  validate :admin_has_legal_value

  def admin_has_legal_value
    errors.add(:admin, 'must be 0 or 1' ) if not [0, 1].include? admin
  end

  def presence_of_password
    errors[:base] << ("Password can't be blank") if password_hash.nil?
  end

  def admin_in_words
    return @@admin_status[admin]
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create_random_password
    chars = [('a'..'z'),(0..9)].map{|i| i.to_a}.flatten
    return (0..12).map{ chars[rand(chars.length)] }.join
  end

  def send_reset_password_email
    #TODO implement this
    raise NotImplementedError
  end

end