# require_relative "./noukod_project_1/version"
# require_relative './noukod_project_1/cli'

class NoukodProject1::News
    attr_accessor :category, :title, :description
  
    def self.today_news
        # Scrape woot and meh and then return deals based on that data
       self.scrape_news
    end
  
  def self.scrape_news
  
    news = []
  
    news << self.scrape_news_met
    # deals << self.scrape_meh
    #Go to woot, find the product
    # Extract the properties
    #instantiate a deal
  
    #Go to meh
    news
  end
  
    def self.scrape_news_met
      doc = Nokogiri::HTML(open("https://metropolehaiti.com/"))
      
      news_ = self.new
      news_.title = doc.search("top-menu-3").text.strip
      # deal.name = doc.search("h2.main-title").text.strip
      # deal.price = doc.search("span.price").text.strip
      # deal.url = doc.search("a.wantone").first.attr("href")
      # deal.availability = true
      news_

    end

    # def self.scrape_meh
    #   doc = Nokogiri::HTML(open("https://meh.com"))
      
    #   deal = self.new
    #   deal.name = doc.search("section.features h2").text.strip
    #   deal.price = doc.search("button.buy-button").text.gsub("Buy it","").strip
    #   deal.url = "https://meh.com"
    #   deal.availability = true
    #   deal

    # end
  
  end
  