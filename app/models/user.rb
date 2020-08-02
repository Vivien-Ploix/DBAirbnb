class User < ApplicationRecord
  has_many :accomodations
  has_many :managed_reservations, foreign_key: 'manager_id', class_name: "Reservation"
  has_many :booked_reservations, foreign_key: 'guest_id', class_name: "Reservation"

  validates :phone_number, presence: true, format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "valid email adress please" }
end
