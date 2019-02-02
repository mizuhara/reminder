class RemindMailDeliveryJob < ApplicationJob
  queue_as :default

  def perform(schedule)
    unless schedule.nil?
      user = User.find(schedule.user_id)
      unless user.nil?
        RemindMailer.with(
          to: user.email, start_date_time: schedule.start_date_time, detail: schedule.detail
        ).send_mail.deliver_now
      end
    end
  end
end
