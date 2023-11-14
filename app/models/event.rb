class Event < ApplicationRecord

  #Associations
  has_many :user_events
  has_many :users, through: :user_events

  # Validations
  validates :title, presence: true
  validates :start_time, presence: true
  validates :location_coordinates, presence: true

  # Enums
  enum status: { active: 0, completed: 1, cancelled: 2 }
end
