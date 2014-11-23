class Recipient < ActiveRecord::Base

  validates :email, presence: true
  validates :email,uniqueness: {message: "You have already subscribed for our newsletter"}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
