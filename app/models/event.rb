class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"
  validates :start_date, presence: true
  # duration en minutes
  validates :duration, 
    presence: true,
    numericality: { greater_than: 0 }
  validates :title, 
    presence: true,
    length: { in: 5..140 }
  validates :description, 
    presence: true,
    length: { in: 20..1000 }
  validates :price, 
    presence: true,
    numericality: { in: 1..1000 }
  validates :location, presence: true
  validate :start_date_cannot_be_in_the_past,
    :duration_multiple_5

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
      !start_date.blank? and start_date < Date.today
  end

  def duration_multiple_5
    errors.add(:duration, "must be a multiple of 5 greater") if
      duration % 5 != 0
  end

  def end_date
    return start_date + duration * 60
  end

end
