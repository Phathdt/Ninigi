class SendEmailRestaurantJob < ApplicationJob
  queue_as :send_email

  def perform(state, restaurant, owner, locale)
    RestaurantMailer.send_email(state, restaurant, owner, locale).deliver_later
  end
end
