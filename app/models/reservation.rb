class Reservation < ApplicationRecord
  belongs_to :accomodation
  belongs_to :manager, class_name: "User"
  belongs_to :guest, class_name: "User"

  validate :no_reservation_overlap
  validate :start_must_be_before_end_date
  validates :start_date, presence: true
  validates :end_date, presence: true





  after_create :send_welcome_email



  def start_must_be_before_end_date
    errors.add(:start_date, "must be before end date") unless
        start_date < end_date
  end 


  def duration
    a = start_date.to_i
    b = end_date.to_i

    puts "Votre séjour durera #{(b-a)/3600/24} jours."

  end 

  def send_welcome_email
    puts "#{User.find(guest_id).first_name} #{User.find(guest_id).last_name}, Merci de votre réservation, nous sommes ravis de pouvoir vous accueillir prochainement dans notre établissement."
  end

  def no_reservation_overlap
    if (Reservation.where("(? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date) AND accomodation_id = ?", self.start_date, self.end_date, self.accomodation_id).any?)
       errors.add(:end_date, 'it overlaps another reservation')
    end
  end

end
