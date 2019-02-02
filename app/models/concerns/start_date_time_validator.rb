class StartDateTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    now = DateTime.now
    value ||= now - 1.year
    earliest_start_date_time = now + 15.minutes

    unless earliest_start_date_time < value
      record.errors.add(attribute, "は#{earliest_start_date_time.to_s(:datetime)}以降を指定してください")
    end
  end
end
