require 'spec_helper'

describe Prezio::SyntaxHighlighter do
  HTML = <<-HTML
  <section>welcome</section>

  <script type="text/javascript">alert('hello');</script>

  <section>
    <script lang="ruby">
      def hello
        puts "hello ruby"
      end
    </script>
  </section>

  <section>
    <script lang="python">
      def hello():
        print "hello python"
    </script>
  </section>

  <section>goodbye</section>
  HTML

  let(:result) { Prezio::SyntaxHighlighter.highlight(HTML) }

  it "keeps the non-code sections" do
    result.should include("<section>welcome</section>")
    result.should include("<section>goodbye</section>")
  end

  it "highlighs all the code sections" do
    result.should include('class="highlight"')
    result.should include('hello ruby')
    result.should include('hello python')
  end

  it "does not replace regular script tags" do
    result.should include(%q{<script type="text/javascript">alert('hello');</script>})
  end

  it "does not add body/html tags to content" do
    result.should_not include('body')
    result.should_not include('html')
  end

  it "adds the css for the highlighted code" do
    result.should include('style')
  end
end
