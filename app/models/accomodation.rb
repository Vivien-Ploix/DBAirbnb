class Accomodation < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :reservations
end
