class SendEmailManagerRequestJob < ApplicationJob
  queue_as :send_email

  def perform(restaurant, manager, from_state, to_state, locale)
    ManagerRestaurantMailer.send_email(restaurant, manager, from_state, to_state, locale).deliver_later
  end
end
