class ScheduleUploader
  attr_reader :user, :profile_name, :days

  def self.perform(params)
    new(params).perform
  end

  def initialize(params)
    @user = params[:user]
    @profile_name = params[:profile_name]
    @days = {
      "2014/06/12" => "Thursday",
      "2014/06/13" => "Friday",
      "2014/06/14" => "Saturday",
      "2014/06/15" => "Sunday"
    }.freeze
  end

  def perform
    days.each_pair do |date, day|
      full_path = "http://lineup.bonnaroo.com/#{profile_name}/schedule/#{date}"
      begin
        document = HTMLDocument.from(full_path)
      rescue
        if schedule = Schedule.find_by(user: user, profile_name: profile_name)
          schedule.destroy
        end
        return false
      end
      BonnarooSchedule.upload(document: document, user: user, profile_name: profile_name)
    end
  end
end
