require 'spec_helper'

describe Prezio::DZSlidesWrapper do
  def wrap(html)
    Prezio::DZSlidesWrapper.wrap(html)
  end

  it "adds the HTML5 doctype" do
    wrap("the content").should include("<!DOCTYPE html>")
  end

  it "adds the meta tag" do
    wrap("the content").should include('<meta charset="utf-8">')
  end

  it "adds the styles" do
    wrap("the content").should include("<style>")
    wrap("the content").should include(".view section")
    wrap("the content").should include("</style>")
  end

  it "adds the JS" do
    wrap("the content").should include("<script>")
    wrap("the content").should include("Dz.init")
    wrap("the content").should include("Dz.onkeydown")
    wrap("the content").should include("</script>")
  end

  it "keeps the original content" do
    html = "<section>hello</section>"
    wrap(html).should include(html)
  end
end
