class Schedule < ActiveRecord::Base
  has_many :schedule_shows, dependent: :destroy
  has_many :shows, through: :schedule_shows
  belongs_to :user

  validates :profile_name, :user, :user_id, presence: true
  validates :profile_name, uniqueness: true

  auto_strip_attributes :profile_name, squish: true

  def attending?(show)
    shows.include?(show)
  end

  def not_uploaded?
    false
  end
end
