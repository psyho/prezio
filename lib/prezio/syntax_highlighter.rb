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
      styles_file = File.expand_path("../octopress/highlight.html", __FILE__)
      html = File.read(styles_file)
      doc.add_child(html)
    end

    def highlight(node)
      text = node.inner_html.to_s
      code = Pygments.highlight(text, lexer: node['lang'])
      code = code.match(/<pre>(.*)<\/pre>/m)[1].to_s.gsub(/\s*\Z/, '')
      tableize_code(code, node['lang'])
    end

    # taken from octopress
    def tableize_code (str, lang = '')
      table = '<div class="highlight"><table><tr><td class="gutter"><pre class="line-numbers">'
      code = ''
      str.lines.each_with_index do |line,index|
        table += "<span class='line-number'>#{index+1}</span>\n"
        code  += "<span class='line'>#{line}</span>"
      end
      table += "</pre></td><td class='code'><pre><code class='#{lang}'>#{code}</code></pre></td></tr></table></div>"
    end
  end
end
