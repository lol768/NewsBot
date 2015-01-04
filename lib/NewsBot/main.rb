require 'cinch'
require 'NewsBot/news_plugin'
require './config.rb'
require 'cinch/commands/help'
module NewsBot

  def self.main
    bot = Cinch::Bot.new do
      configure do |c|
        c.nick = NewsBot::Config::CONNECTION_SETTINGS[:nick]
        c.server = NewsBot::Config::CONNECTION_SETTINGS[:server]
        c.port = NewsBot::Config::CONNECTION_SETTINGS[:port]
        c.password = NewsBot::Config::CONNECTION_SETTINGS[:password]
        c.ssl.use = NewsBot::Config::CONNECTION_SETTINGS[:ssl]
        c.ssl.verify = NewsBot::Config::CONNECTION_SETTINGS[:ssl_verify]
        c.channels = []
        c.plugins.plugins = [NewsBot::NewsPlugin, Cinch::Commands::Help]
        c.verbose = true
        c.plugins.prefix = /^\?/
      end
    end
    bot.start
    puts "block"
  end
end