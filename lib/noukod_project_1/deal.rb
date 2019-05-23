# require_relative "./noukod_project_1/version"
# require_relative './noukod_project_1/cli'

class NoukodProject1::Deal
    attr_accessor :name, :price, :availability, :url
  
    def self.today
        # Scrape woot and meh and then return deals based on that data
       self.scrape_deals
    end
  
  def self.scrape_deals
  
    deals = []
  
    deals << self.scrape_woot
    deals << self.scrape_meh
    #Go to woot, find the product
    # Extract the properties
    #instantiate a deal
  
    #Go to meh
    deals
  end
  
    def self.scrape_woot
      doc = Nokogiri::HTML(open("https://woot.com"))
      
      deal = self.new
      deal.name = doc.search("h2.main-title").text.strip
      deal.price = doc.search("span.price").text.strip
      deal.url = doc.search("a.wantone").first.attr("href")
      deal.availability = true
      deal

    end

    def self.scrape_meh
      doc = Nokogiri::HTML(open("https://meh.com"))
      
      deal = self.new
      deal.name = doc.search("section.features h2").text.strip
      deal.price = doc.search("button.buy-button").text.gsub("Buy it","").strip
      deal.url = "https://meh.com"
      deal.availability = true
      deal

    end
  
  end
  