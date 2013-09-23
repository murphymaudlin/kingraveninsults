class User < ActiveRecord::Base
  attr_accessible :username, :password_hash, :token
  
  before_validation :ensure_token
  
  validates :username, :password_hash, :token, presence: true
  validates :username, uniqueness: true
  
  def reset_token!(force = true)
    return unless force || self.token.nil?
    
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
  end
  
  def ensure_token
    reset_token!(false)
  end
end
