"""Convert Markdown-formatted text into html.

Optionally, use a page template.
"""

import jinja2
import markdown

def ReadFile(filename):
  return ''.join(open(filename).readlines())

if __name__ == '__main__':

  from optparse import OptionParser

  parser = OptionParser()
  parser.add_option('-t', '--template', dest='template',
                    help='Jinja2 template with content block.')
  (options, args) = parser.parse_args()

  print dir(markdown)

  rendered_content = markdown.markdown(ReadFile(args[0]))
  if options.template:
    template = jinja2.Template(ReadFile(options.template))
    print template.render({'content': rendered_content})
  else:
    print rendered_content

