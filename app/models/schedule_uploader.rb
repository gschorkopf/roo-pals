class ScheduleUploader
  attr_reader :user, :url, :days

  def self.perform(params)
    new(params).perform
  end

  def initialize(params)
    @user = params[:user]
    @url = params[:url]
    @days = {
      "2014/06/12" => "Thursday",
      "2014/06/13" => "Friday",
      "2014/06/14" => "Saturday",
      "2014/06/15" => "Sunday"
    }.freeze
  end

  def perform
    days.each_pair do |date, day|
      full_path = "http://lineup.bonnaroo.com/#{url}/schedule/#{date}"
      begin
        document = HTMLDocument.from(full_path)
      rescue
        if schedule = Schedule.find_by(user: user, url: url)
          schedule.destroy
        end
        return false
      end

      doc.css('.ds-attending').each do |event|
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
end
