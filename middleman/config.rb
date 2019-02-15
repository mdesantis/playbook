# Settings
set :source, '..'
set :css_dir, 'middleman/assets/stylesheets'
set :js_dir, 'middleman/assets/javascripts'
set :images_dir, 'middleman/assets'
set :fonts_dir, 'middleman/assets/fonts'
set :layouts_dir, 'middleman/layouts'
set :data_dir, 'data'
set :helpers_dir, 'helpers'

## Playbook settings
set :playbook_section_topics_dir, 'topics'
set :playbook_topic_belongs_to_section_key, :title
set :playbook_section_has_many_topics_key, 'playbook-section-topics'

# Ignored paths
ignore /^middleman(?!\/assets).*/
ignore '**/.keep'
ignore 'topics/**'

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Pretty urls
activate :directory_indexes

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'
page '/', layout: 'home'
page '/sections/*', layout: 'playbook'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Middleman fails to reload helpers, although it notices their modification
# This force-reloads them. See
# https://github.com/middleman/middleman/issues/1105#issuecomment-305715209
Dir['helpers/*'].each(&method(:load))

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
