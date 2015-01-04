class NewsItem
  attr_accessor :url, :title, :source, :breaking

  @title = nil
  @url = nil
  @source = nil
  @breaking = nil

  def initialize(title, url, source, breaking)
    @title = title
    @url = url
    @source = source
    @breaking = breaking
  end


end