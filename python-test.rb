require './lib/app'
require './lib/docs'
require './lib/docs/scrapers/python'
require 'fileutils'

# Initialize the scraper
scraper = Docs::Scrapers::Python.new

# Set the desired version
scraper.options[:version] = '3.9'

# Set output directory
# output_dir = './my_local_docs/python_3.9'
# FileUtils.mkdir_p(output_dir) unless File.directory?(output_dir)
# scraper.options[:output_dir] = output_dir

# Start the scraping process
puts scraper.get_latest_version(opts)

# # Save pages manually (if needed)
# scraper.pages.each do |page|
#   path = File.join(output_dir, page[:path])
#   FileUtils.mkdir_p(File.dirname(path)) unless File.directory?(File.dirname(path))
#   File.write(path, page[:content])
# end

# puts "Documentation for Python 3.9 has been scraped and saved to #{output_dir}."
