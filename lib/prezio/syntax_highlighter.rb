require 'nokogiri'
require 'pygments'

module Prezio
  class SyntaxHighlighter
    def self.highlight(html)
      new(html).to_s
    end

    def initialize(html)
      @html = html
    end

    def to_s
      doc = Nokogiri::HTML.fragment(@html)

      replace_code_tags(doc)
      add_highliting_styles(doc)

      doc.to_s
    end

    private

    def replace_code_tags(doc)
      doc.css("code").each do |node|
        node.replace(highlight(node))
      end
    end

    def add_highliting_styles(doc)
      html = "<style>#{Pygments.css('.highlight')}</style>"
      doc.add_child(html)
    end

    def highlight(node)
      Pygments.highlight(node.inner_html.to_s, lexer: node['lang'])
    end
  end
end
