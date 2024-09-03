module Docs
  class ExampleScraper < UrlScraper
    self.base_url = 'https://example.com'
    self.initial_paths = ['/']

    def process_response(response)
      super(response)
      puts "Title: #{response.body.match(/<title>(.*?)<\/title>/)[1]}"
    end
  end
end
