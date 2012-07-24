require "spec_helper"

describe "prezio convert <template> <presentation>" do
  let(:template_file) { fixture_file("sample_slides.html") }
  let(:presentation_file) { "/tmp/presentation.html" }

  let(:content) { File.read(presentation_file) }

  before do
    system("rm -rf #{presentation_file}")
    @status = run_prezio_convert
  end

  it "creates the presentation file" do
    File.exists?(presentation_file).should be_true
  end

  it "creates a presentation that contains the original slides" do
    content.should include("Include any html you like")
  end

  it "wraps content using DZSlides template" do
    content.should include("{{{{ dzslides core")
  end

  it "converts code snippets"

  it "returns status code 0" do
    @status.should be_true
  end

  def fixture_file(name)
    File.expand_path("../fixtures/#{name}", __FILE__)
  end

  def run_prezio_convert
    system("./bin/prezio convert #{template_file} #{presentation_file}")
  end
end
