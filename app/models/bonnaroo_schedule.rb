class BonnarooSchedule
  attr_reader :user, :profile_name, :document

  def self.upload(params)
    new(params).upload
  end

  def initialize(params)
    @document = params[:document]
    @profile_name = params[:profile_name]
    @user = params[:user]
  end

  def upload
    events.each do |event|
      if show = Show.find_by(artist_name: artist_name(event))
        schedule = Schedule.find_or_create_by(user: user, profile_name: profile_name)
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
