class Phone < ActiveRecord::Base
  belongs_to :person
  validates :address, 
    presence: true,
    format: { with: /\A[0-9\.\(\)\+-]+\z/i }

  def display_text
    self.address
  end
end
