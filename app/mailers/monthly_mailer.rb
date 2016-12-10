class MonthlyMailer < ApplicationMailer
  def mail_month
    admins = User.email_admin
    d = Time.now
    start_date = d.beginning_of_month
    end_date = d.end_of_month
    @orders = Order.order_in_month(start_date, end_date)
    @hot_trend_products = Product.hot_trend
    mail to: admins.map(&:email).uniq,
      subject: t("statistic_order_admin_end_month")
  end
end
