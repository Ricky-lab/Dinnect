class Event < ApplicationRecord

  #Associations
  has_many :user_events
  has_many :users, through: :user_events

  # Validations
  validates :title, presence: true
  validates :start_time, presence: true
  validates :location_coordinates, presence: true

  def active?
    status == 'active'
  end
  # Enums
  enum status: { active: 0, full: 1, completed: 2, cancelled: 3 }
end
