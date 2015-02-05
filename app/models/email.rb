class Email < ActiveRecord::Base
  belongs_to :person
  validates :address, 
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  def display_text
    self.address
  end
end
