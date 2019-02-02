class Schedule < ApplicationRecord
  belongs_to :user

  scope :at, -> (datetime) { where(start_date_time: datetime...(datetime + 1.day)) }

  scope :search_with, -> (schedule_id) { where(id: schedule_id) }

  validates :start_date_time,
    presence: true,
    start_date_time: true

  validates :detail,
    presence: true

  after_create :execute_remind_mail_delivery_job

  private

  def execute_remind_mail_delivery_job
    RemindMailDeliveryJob.set(wait_until: remind_time).perform_later(self)
  end

  def remind_time
    self.start_date_time - 15.minutes
  end
end
