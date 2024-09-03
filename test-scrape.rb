require_relative './lib/docs/core/scraper'
require_relative 'url_scraper'
require_relative './lib/docs/scrapers/example_scraper.rb'

scraper = Docs::ExampleScraper.new
scraper.build_pages do |page|
  puts "Scraped data: #{page}"
end
