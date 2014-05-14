class Schedule < ActiveRecord::Base
  has_many :schedule_shows
  has_many :shows, through: :schedule_shows
  belongs_to :user

  validates :url, presence: true
  validates :url, uniqueness: true

  auto_strip_attributes :url, squish: true

  def attending?(show)
    shows.include?(show)
  end

  def not_uploaded?
    false
  end
end
