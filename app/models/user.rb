class User < ActiveRecord::Base
  has_secure_password
  has_many :schedules, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true

  scope :by_name, -> { order(:first_name) }

  auto_strip_attributes :first_name, :last_name, :email, squish: true

  before_create { generate_token(:auth_token) }

  def followed_schedules
    Schedule.where(user_id: followed_users_and_self_ids)
  end

  def followed_shows
    Show.includes(:schedules).where(schedules: {id: followed_schedules.pluck(:id)})
  end

  def followable_users
    User.where.not(id: followed_users_and_self_ids)
  end

  def schedule
    schedules.first || NullSchedule.new
    # TODO: This will be refactored once we do multiple festivals.
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  private

  def followed_users_and_self_ids
    followed_users.pluck(:id) << id
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
