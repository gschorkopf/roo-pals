class User < ActiveRecord::Base
  has_many :schedules

  validates :name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true

  auto_strip_attributes :name, :email, squish: true

  before_create { generate_token(:auth_token) }

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
