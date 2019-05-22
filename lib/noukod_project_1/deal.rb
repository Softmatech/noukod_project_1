# require_relative "./noukod_project_1/version"
# require_relative './noukod_project_1/cli'

class NoukodProject1::Deal
    attr_accessor :name, :price, :availability, :url
  
    def self.today
    # puts <<-DOC.gsub /^\s*/, ''
    # 1. PCH Digital Pulse Massager - $27 - Still available!
    # 2. Lenovo ThinkPad 11E 11.6 - $199.99 - Still available!
    # DOC

    deal_1 = self.new
    deal_1.name = "PCH Digital Pulse Massager"
    deal_1.price = "$27"
    deal_1.availability = true
    deal_1.url = "https://meh.com/"

    deal_2 = self.new
    deal_2.name = "Lenovo ThinkPad 11E 11.6"
    deal_2.price = "$199.99"
    deal_2.availability = true
    deal_2.url = "https://www.woot.com/offers/lenovo-thinkpad-11-6-quad-core"

        [deal_1,deal_2]
    #       self.scrape_deals
#     end
  
#   def self.scrape_deals
  
#     deals = []
  
#     deals << self.scrape_woot
#     deals << self.scrape_meh
#     #Go to woot, find the product
#     # Extract the properties
#     #instantiate a deal
  
#     #Go to meh
#     deals
  end
  
#     def self.scrape_woot
#       doc = Nokogiri::HTML(open("https://woot.com"))
#       binding.pry
#     end
  
  end
  