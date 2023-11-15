class User < ApplicationRecord
  # Associations
  has_many :user_events
  has_many :events, through: :user_events
  has_one :profile, dependent: :destroy

  # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  # after sign up, this will automatically creata a new record in profile
  after_create :build_default_profile
  after_update :sync_profile_email


  def build_default_profile
    build_profile(email: self.email).save
  end

  def sync_profile_email
    profile.update!(email: email) if profile.present?
  end
end
