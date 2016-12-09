class User < ActiveRecord::Base
  validates :session_token, :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token
  
  has_many :notes


  attr_reader :password

  def self.generate_session_token
    SecureRandom.base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    digest = BCrypt::Password.new(self.password_digest)
    digest.is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user == nil
    user.is_password?(password) ? user : nil
  end

end
