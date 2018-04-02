class ProcessImagesJob < ApplicationJob
  queue_as :image_processing

  after_perform do |job|
    job.arguments.first.update(temp_url: nil)
  end

  def perform(image)
    image.photo = open(image.temp_url)
    image.save
  end
end
