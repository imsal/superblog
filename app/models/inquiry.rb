class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: {with: /.+@.+/}
  validates :message, presence: true
end
