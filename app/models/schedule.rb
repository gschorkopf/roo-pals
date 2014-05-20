class Schedule < ActiveRecord::Base
  has_many :schedule_shows, dependent: :destroy
  has_many :shows, through: :schedule_shows
  belongs_to :user

  validates :url, :user, :user_id, presence: true
  validates :url, uniqueness: true

  auto_strip_attributes :url, squish: true

  def attending?(show)
    shows.include?(show)
  end

  def not_uploaded?
    false
  end
end
