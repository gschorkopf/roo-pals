class User < ActiveRecord::Base
  has_secure_password
  has_many :schedules

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true

  auto_strip_attributes :first_name, :last_name, :email, squish: true

  before_create { generate_token(:auth_token) }

  def schedule
    schedules.first || NullSchedule.new
    # TODO: This will be refactored once we do multiple festivals.
  end

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
