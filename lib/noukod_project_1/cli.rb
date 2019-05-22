class NoukodProject1::CLI
def call
    list_deals
    menu
    goodbye
end

def list_deals
    puts "Today's Daily Deals:"
    @deals = NoukodProject1::Deal.today
    @deals.each.with_index(1) do |deal, i|
        puts "#{i}. #{deal.name} - #{deal.price} - #{deal.availability}"
    end
end

def menu
    input = nil
    while input != "exit"
        puts "Enter the number of the deal you'd like more info on or type list to see deals or type exit:"
    input = gets.strip.downcase
    if input.to_i > 0
        the_deal = @deals[input.to_i - 1]
        puts "#{the_deal.name} - #{the_deal.price} - #{the_deal.availability}"
        puts @deals[input.to_i - 1]
    elsif input == "list"
        list_deals
        else
        puts "Not sure what you want, type list or exit."
    end
end   
end

def goodbye
    puts "See you tomorrow for more deals!!!"
end

end