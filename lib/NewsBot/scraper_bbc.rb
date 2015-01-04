require 'json'
require 'net/http'
require 'NewsBot/news_item'
require 'cinch/formatting'
module NewsBot
  class ScraperBBC

    @url = 'http://www.bbc.co.uk/news/10284448/ticker.sjson'
    @processed_urls = []

    def self.get_source
      Cinch::Formatting.format(:bold, Cinch::Formatting.format(:red, "BBC"))
    end

    def self.get_news_items
      items = []
      content = Net::HTTP.get_response(URI.parse(@url)).body
      result = JSON.parse(content)
      result['entries'].each do |item|
        if @processed_urls.include? item['url']
          next
        end
        items.push(NewsItem.new(item['headline'], item['url'], get_source, item['isBreaking'] == 'true'))
        @processed_urls.push(item['url'])
      end
      items
    end

  end
end
