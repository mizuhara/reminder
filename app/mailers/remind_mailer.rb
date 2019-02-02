class RemindMailer < ApplicationMailer
  default from: ENV['GMAIL_ADDRESS']

  def send_mail
    to = params[:to]
    start_time = params[:start_date_time].to_s(:time)
    @detail = params[:detail]
    mail(to: to, subject: "本日#{start_time}から予定があります")
  end
end
