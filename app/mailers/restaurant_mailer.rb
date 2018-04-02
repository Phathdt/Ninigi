class RestaurantMailer < ApplicationMailer
  def send_email(state, restaurant, receiver, locale)
    subject =
      email_content_from(:subject,
                         state: state, name: receiver.name, locale: locale)

    @content =
      email_content_from(:content,
                         state: state, name: receiver.name,
                         restaurant: restaurant.name, time: restaurant.updated_at.to_s,
                         link: api_v1_restaurant_url(restaurant).gsub('api/v1/', ''),
                         comment: restaurant.comment, contact_email: ENV['REPLY_EMAIL'],
                         locale: locale)

    mail(to: receiver.email, subject: subject)
  end

  private

  def email_content_from(title, opts)
    options = opts
    state = options.delete(:state)

    I18n.with_locale(options[:locale]) do
      I18n.t("restaurant_mailer.notify_changed_status.#{title}.#{state}.", options)
    end
  end
end
