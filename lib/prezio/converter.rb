module Prezio
  class Converter
    def self.convert(template_file, presentation_file)
      content = File.read(template_file)
      content = SyntaxHighlighter.highlight(content)
      content = DZSlidesWrapper.wrap(content)
      File.open(presentation_file, "w") {|f| f.write(content) }
    end
  end
end
