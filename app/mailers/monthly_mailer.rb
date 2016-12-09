class MonthlyMailer < ApplicationMailer
  # default from: Settings.mail_from
  def mail_month
    admins = User.email_admin
    @orders = Order.orders_of_month
    @hot_trend_products = Product.hot_trend
    mail to: admins.map(&:email), subject: t("test")
  end
end
