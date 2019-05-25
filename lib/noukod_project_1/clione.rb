class NoukodProject1::CLIONE

def call
    list_news
    main_menu
    # goodbye
end

def list_news
    puts "Welcome to Haïti Scrapping news!"
    @news_type = NoukodProject1::News.today_news
    array_menu = []
    for i in 0..@news_type.length - 1
        array_menu << i + "#{@news_type[i]}"
    end    
    puts array_menu
end

def main_menu
    input = nil
    while input != "quit"
        puts "Choose a news type/category to display or type quit to exit :"
    input = gets.strip.downcase
    if input.to_i > 0
        news = @news_type[input.to_i - 1]
        puts "#{news.title}"
        puts @news_type[input.to_i - 1]
    elsif input == "list"
        list_news
        else
        puts "Error, Please choose a valid news type/category to display or type quit to exit :"
    end
end   
end

def goodbye
    puts "See you tomorrow for more deals!!!"
end

end