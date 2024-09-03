=begin

/ 

require 'bundler/setup'
Bundler.require :default, :docs

require 'active_support'
require 'active_support/core_ext'
I18n.enforce_available_locales = true

=end

# Load necessary dependencies
require 'bundler/setup'
Bundler.require(:default, :docs)

# Require the necessary files from the project
require 'html_pipeline'
require 'active_support/core_ext/string/inflections'
require_relative 'lib/docs/core/instrumentable.rb'
require_relative 'lib/docs/core/doc.rb'
require_relative 'lib/docs/core/filter.rb'
require_relative 'lib/docs/filters/core/apply_base_url'
require_relative 'lib/docs/core/filter_stack.rb'
require_relative 'lib/docs/core/scraper.rb'
require_relative 'lib/docs/core/scrapers/file_scraper.rb'
require_relative 'lib/docs/scrapers/bash.rb'  # Adjust the path as necessary


bash_scraper = Docs::Bash.new

latest_version = bash_scraper.get_latest_version(opts)

puts "latest Bash Version: #{latest_version}"
