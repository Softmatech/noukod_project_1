# require_relative "./noukod_project_1/version"
# require_relative './noukod_project_1/cli'

class NoukodProject1::News
  attr_accessor :category, :title, :description, :title_article, :description_article, :url, :details_title, :details_description

  @title_article_ = []
  @@urls = []

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
    link = ""
    articles = {}
    news_by_type = self.new
    if doc.search("span").css(".article-titre").text.strip != ''
    news_by_type.title_article = doc.search("span").css(".article-titre").text.strip
    end
    news_by_type.description_article = doc.search("span").css(".article-text-2").text

    doc.css('table').collect do |x|
        link = x.css('tr').css('td.news-link').css('a').attr('href')
        if link != nil
        @@urls << link.value
        end
    end
    # puts "#{@@urls}"
    news_by_type
  
  end

  def url
    @@urls
  end

  def self.scrape_news_details(link)
    doc = Nokogiri::HTML(open(link))
    details = self.new
    details.details_title = doc.search("span").css(".text-title").text.strip
    details.details_description = doc.search("span").css(".article-text").text.strip
    details
  end

end
