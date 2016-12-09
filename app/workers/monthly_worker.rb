class MonthlyWorker
  include Sidekiq::Worker

  MAIL_MONTH = 1

  def perform action
    case action
    when MAIL_MONTH
      # Order.all.each do |order|
        MonthlyMailer.mail_month.deliver_now
    end
  end

  private
  def send_email_when_end_month
    MonthlyMailer.mail_month.deliver_now
  end
end
