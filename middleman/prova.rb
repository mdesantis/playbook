require 'pathname'
require 'yaml'

def title_to_frontmatter(file_path)
  file_path = Pathname file_path
  lines = file_path.readlines "\n"
  first_line = lines.first

  return unless first_line.start_with? '# '

  yaml = { 'title' => first_line.chop.gsub(/^# /, '') }.to_yaml
  frontmatter = "#{yaml}---"

  # puts frontmatter, lines[1, lines.length+1].flatten
  file_path.write [frontmatter, lines[1, lines.length+1].flatten].join
end

# title_to_frontmatter '../development/design.html.md'
