require "NewsBot/version"
require "NewsBot/news_item"
require "NewsBot/scraper_bbc"
require 'cinch'
require 'cinch/commands'
require 'cinch/commands/help'
require 'priority_queue'
require 'cinch/formatting'

module NewsBot
  class NewsPlugin
    include Cinch::Plugin
    include Cinch::Commands

    command :version, {},
            summary: 'Displays version', description: 'Displays the current version of the NewsBot application.'

    @news = nil

    def news
      @news
    end

    def news=(value)
      @news = value
    end

    def initialize(*args)
      super
      self.news = PriorityQueue.new

    end


    def version(msg)
      user_reply msg, "I'm running v" + NewsBot::VERSION
    end

    def user_reply(msg, response)
      msg.reply msg.user.nick + ': ' + response
    end

    timer 5, method: :print_news
    timer 10, method: :get_news

    def print_news
      self.broadcast_news_item(self.grab_next_news_item)
    end

    def get_news
      items = NewsBot::ScraperBBC.get_news_items
      items.each do |item|
        self.news.push(item, item.breaking ? 1 : 3)
      end
      debug('Added ' + items.count.to_s + ' items!')
    end

    def grab_next_news_item
      item = self.news.min
      if item == nil
        return nil
      end
      self.news.delete(item[0])
      item[0]
    end

    # @param [NewsItem] item
    def broadcast_news_item(item)

      if item == nil
        debug 'No news'
        return
      end
      fs = '[' + item.source + '] '

      if item.breaking
        fs = fs + Format(:bold, Format(:red, 'Breaking news: '))
      end

      self.bot.channels.each do |channel|
        channel.send fs + item.title + ' - ' + item.url
      end
    end
  end
end
