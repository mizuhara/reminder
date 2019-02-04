module ScheduleDecorator
  def start_time
    start_date_time.to_s(:time)
  end

  def detail_summary
    truncate(detail, length: 10, omission: '...')
  end
end
