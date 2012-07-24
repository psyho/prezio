module Prezio
  def self.convert(template_file, presentation_file)
    Prezio::Converter.convert(template_file, presentation_file)
  end
end

Dir[File.expand_path("../**/*.rb", __FILE__)].each do |file|
  require file
end
