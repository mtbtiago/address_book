class Phone < ActiveRecord::Base
  belongs_to :person
  validates :address, presence: true
end
