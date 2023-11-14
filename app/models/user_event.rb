class UserEvent < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :event

  # Enums
  enum role: { holder: 0, participator: 1 }

  # Validations
  validates :user_id, uniqueness: { scope: :event_id }
end
