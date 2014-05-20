class BonnarooSchedule
  attr_reader :user, :url, :document

  def self.upload(params)
    new(params).upload
  end

  def initialize(params)
    @document = params[:document]
    @url = params[:url]
    @user = params[:user]
  end

  def upload
    document.css('.ds-attending').each do |event|
      artist_name = event.css('.ds-event-title a').children.first.content
      range = event.css('.ds-time-range').children.first.content
      starting_at = range.split(" - ").first
      show = Show.find_by(artist_name: artist_name)
      if show
        schedule = Schedule.find_or_create_by(user: user, url: url)
        ScheduleShow.create(show: show, schedule: schedule)
      end
    end
  end
end
