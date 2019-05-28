class NoukodProject1::CLIONE

def call
    list_news
    main_menu
    # goodbye
end

def list_news
    @menu_array = []
    
    puts "Welcome to Haïti Scrapping news!"
    @news_type = NoukodProject1::News.today_news   
    
    @news_type.each.with_index(1) do |_news, i|
        @menu_array = _news
    end
    
    for i in 0..@menu_array.length - 1
        puts "#{i+1})#{@menu_array[i].strip}"
    end 
    puts "------------------------------------------------------------------------------------------------------------------"
end

def second_menu(type)
    @title_array_2 = []
    @news_by_type_title = NoukodProject1::News.scrape_news_by_type(type)

    @title_array = @news_by_type_title.strip.split("\n")
    # puts "#{@title_array}"

    @title_array.each.with_index(1) do |_title, i|
        @title_array_2 << _title
    end

    # puts "#{@title_array_2.size}"
    
    for j in 0..@title_array_2.size - 1
        puts "#{j+1})#{@title_array_2[j].strip}"
    end 
    puts "------------------------------------------------------------------------------------------------------------------"
end


def main_menu
    input = nil
    while input != "quit"
    puts "Choose a news type/category to display or type quit to exit :"
    input = gets.strip.downcase
    if input.to_i > 0
        news = @menu_array[input.to_i - 1]
        puts "#{news} : "
        puts "------------------------------------------------------------------------------------------------------------------"
        second_menu(news.strip)
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