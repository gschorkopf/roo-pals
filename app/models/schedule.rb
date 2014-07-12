class Schedule < ActiveRecord::Base
  has_many :schedule_shows, dependent: :destroy
  has_many :shows, through: :schedule_shows
  belongs_to :user

  validates :profile_name, :user, :user_id, :festival_id, presence: true
  validates :profile_name, uniqueness: true

  auto_strip_attributes :profile_name, squish: true

  def attending?(show)
    shows.include?(show)
  end

  def not_uploaded?
    false
  end

  def compatibility(schedule)
    same_shows = shows.select { |show| schedule.attending?(show) }
    same_shows.count.to_f / shows.count.to_f
  end
end
