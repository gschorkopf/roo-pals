class ScheduleUploader
  attr_reader :user, :profile_name

  def self.perform(params)
    new(params).perform
  end

  def initialize(params)
    @user = params[:user]
    @profile_name = params[:profile_name]
  end

  def perform
    day_full_paths.each do |full_path|
      begin
        document = HTMLDocument.from(full_path)
      rescue
        destroy_schedule
        false
      end
      BonnarooSchedule.upload(document: document, user: user, profile_name: profile_name)
    end
  end

  private

  def destroy_schedule
    if schedule = Schedule.find_by(user: user, profile_name: profile_name)
      schedule.destroy
    end
  end

  def day_full_paths
    DAYS.map { |day| "http://lineup.bonnaroo.com/#{profile_name}/schedule/#{day}" }
  end

  DAYS = %w(
    2014/06/12
    2014/06/13
    2014/06/14
    2014/06/15
  ).freeze
end
