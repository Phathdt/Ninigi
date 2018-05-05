namespace :generate_aasm do
  desc "TODO"
  task start: :development do
    require 'aasm-diagram'

    AASM_MODEL.each do |model|
      job = model.constantize.new
      AASMDiagram::Diagram.new(job.aasm, "./docs/#{model}.png")
    end
  end
end
