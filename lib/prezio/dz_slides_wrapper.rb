module Prezio
  class DZSlidesWrapper
    def self.wrap(content)
      template.gsub('{{*the slides*}}', content)
    end

    private

    def self.template
      @template ||= File.read(template_file_name)
    end

    def self.template_file_name
      File.expand_path("../dz_slides/template.html", __FILE__)
    end
  end
end
