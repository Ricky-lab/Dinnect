class Profile < ApplicationRecord
  # Association with User
  belongs_to :user

  # Validations
  # None..

  before_save :update_email

  private

  def update_email
    self.email = user.email
  end
end
