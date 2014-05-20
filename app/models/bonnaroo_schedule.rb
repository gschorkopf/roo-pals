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
    events.each do |event|
      if show = Show.find_by(artist_name: artist_name(event))
        schedule = Schedule.find_or_create_by(user: user, url: url)
        ScheduleShow.create(show: show, schedule: schedule)
      end
    end
  end

  private

  def events
    document.css('.ds-attending')
  end

  def artist_name(event)
    event.css('.ds-event-title a').children.first.content
  end
end
