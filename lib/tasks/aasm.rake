namespace :aasm do
  task :generate_images do
    AASM_MODEL.each do |model|
      job = model.constantize.new
      AASMDiagram::Diagram.new(job.aasm, "./docs/#{model}.png");
    end
  end
end
