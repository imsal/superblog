class Subscriber < ApplicationRecord
  before_save :downcase_email

  validates :email, presence: true, uniqueness: true, format: { with: /@/ } 

  private

  def downcase_email
    self.email = email.downcase
  end

end
