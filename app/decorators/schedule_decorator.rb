module ScheduleDecorator
  def start_time
    start_date_time.to_s(:time)
  end
end
