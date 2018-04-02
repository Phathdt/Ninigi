class ManagerRestaurantMailer < ApplicationMailer

  def send_email(restaurant, manager, from_state, to_state, locale)

    subject =
      email_content_from(:subject,
                         from: from_state, to: to_state, name: restaurant.name,
                         owner: restaurant.owner.name, manager: manager.name, locale: locale
                         )
      @content =
      email_content_from(:content,
                         from: from_state, to: to_state, name: restaurant.name,
                         owner: restaurant.owner.name, manager: manager.name, locale: locale,
                         link: api_v1_restaurant_url(restaurant).gsub('api/v1/', '')
                         )
    email_to =  case to_state
                when :pending
                  manager.email
                when :approved
                  restaurant.owner.email
                when :suspended
                  restaurant.owner.email
                else
                  manager.email
                end

    mail(to: email_to, subject: subject)
  end

  private

  def email_content_from(title, opts)
    options = opts
    from = options.delete(:from)
    to = options.delete(:to)

    I18n.with_locale(options[:locale]) do
      I18n.t("manager_request.notify_changed_status.#{title}.#{from}.#{to}", options)
    end
  end
end
