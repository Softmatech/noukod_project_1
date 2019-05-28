# require_relative "./noukod_project_1/version"
# require_relative './noukod_project_1/cli'

class NoukodProject1::News
  attr_accessor :category, :title, :description, :title_article, :description_article, :url

  @title_article_ = []

  def self.today_news
      # Scrape woot and meh and then return deals based on that data
     self.scrape_news
  end

def self.scrape_news
  news = []
  news << self.scrape_news_met
  news
end

  def self.scrape_news_met
    doc = Nokogiri::HTML(open("https://metropolehaiti.com/"))
    news_type = self.new
    news_type.title = doc.search("span").css(".top-menu-3").text.split(" | ")
    news_type.title
  end


  def self.scrape_news_by_type(type)
    suff = "metropole/liste_"+type[0..3].downcase+"_fr.php"
    url = "https://metropolehaiti.com/" + suff
    doc = Nokogiri::HTML(open(url))
    urls = []
    link = ""
    articles = {}
    news_by_type = self.new
    news_by_type.title_article = doc.search("span").css(".article-titre").text.strip unless (doc.search("span").css(".article-titre").text.strip).empty?
    news_by_type.description_article = doc.search("span").css(".article-text-2").text
    news_by_type.title_article
  end

end
