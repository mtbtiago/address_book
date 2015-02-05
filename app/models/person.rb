class Person < ActiveRecord::Base
  has_many :phones, :dependent => :delete_all
  has_many :emails, :dependent => :delete_all

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 30 }

  def full_name
    "#{self.id.to_s}. #{self.name}" + 
    (self.address.present? ? "Addr: #{self.address}" : "")
  end

end
