class Traveler < ActiveRecord::Base
	has_secure_password
  validates :username, :presence => true
	validates :first_name
  has_many :trips
	has_many :tickets, through: :trips
end
