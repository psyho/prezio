# Prezio

A tool to generate HTML5/CSS slideshows.

Uses [DZSlides][dzslides] HTML template and [pygments.rb][pygments] for syntax highlighting.

## Installation

Install the gem using:

    $ gem install prezio

## Usage

Prezio converts simple html files into presentations.

The HTML file should look like this:

"""html
<title>The Title Of Your Presentation</title>

<!-- One section is one slide -->
<section>
  <h1>My Presentation</h1>
  <footer>by John Doe</footer>
</section>

<section>
  <!-- Any HTML -->
  <p>Some random text</p>
</section>

<section>
  <!-- This will be highlighted -->
  <code lang="ruby">
  def greet(name)
    println "Hello, #{name}!"
  end
  </code>
</section>
"""

Convert the template to presentation using the following command:

    $ prezio convert template.html presentation.html

[dzslides]: https://github.com/paulrouget/dzslides
[pygments]: https://github.com/tmm1/pygments.rb/
