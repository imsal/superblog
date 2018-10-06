class Subscriber < ApplicationRecord

  attr_accessor :activation_token

  before_save :downcase_email
  before_create :create_activation_digest
  before_create :create_unsubscribe_digest

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:email,
  presence: true,
  length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false })

  def Subscriber.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def Subscriber.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest") # Could use self.send here but because we are in the user model, it is implied
    return false if digest.nil? # if => false, remainder of block isn't executed
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_columns(activated: true, activated_at: Time.now)
  end

  def unsubscribe
    update_columns(activated: false, unsubscribed: true, unsubscribed_at: Time.now)
  end

  # Sends the activation email
  def send_activation_email
    SubscriberMailer.account_activation(self).deliver_now
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest
  def create_activation_digest
    self.activation_token = Subscriber.new_token
    self.activation_digest = Subscriber.digest(activation_token)
  end

  def create_unsubscribe_digest
    self.activation_token = Subscriber.new_token
    self.unsubscribe_digest = Subscriber.digest(activation_token)
  end

end
