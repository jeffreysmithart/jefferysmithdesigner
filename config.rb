###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###


# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# page "blog/*", :layout => :blog_layout
#page "blog/", :layout => :article_layout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
 activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end



activate :blog do |blog|
  blog.prefix = "/blog/"

  blog.summary_separator = /(READMORE)/
  blog.summary_length = 100

  blog.paginate = true
  blog.per_page = 3
  blog.page_link = "page/:num"

  blog.tag_template = "/blog/tag.html"
  blog.calendar_template = "/blog/calendar.html"

  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = "blog_articles/:year-:month-:day-:title.html"

  #blog.layout = "article_layout"
  # blog.sources = "blog_articles/:title.html"
end

page "/blog/feed.xml", :layout => false



set :css_dir, 'stylesheets'
set :js_dir, 'js'
set :images_dir, 'img'

set :relative_links, true

activate :directory_indexes



# Enable syntax highlighting
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
activate :syntax

activate :breadcrumbs

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.remove   = false
  config.cascade  = false
  config.inline   = true
end


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  activate :directory_indexes

  # activate :critical, :binary => '/usr/local/bin/critical'
  activate :minify_html
  
  activate :gzip

  # Or use a different image path
  # set :http_prefix, "/Content/img/"
end

