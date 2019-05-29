class NoukodProject1::CLIONE

def call
    list_news
    main_menu
    # goodbye
end

def list_news
    @menu_array = []
    puts "\n"
    puts "Welcome to Haïti Scrapping news!"
    puts "\n"
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
    @@title_array_2 = []
    @news_by_type_title = NoukodProject1::News.scrape_news_by_type(type).title_article
    @@title_array_url = NoukodProject1::News.scrape_news_by_type(type).url
    @title_array = @news_by_type_title.strip.split("\n")
    # puts "------ #{@title_array_url}"

    @title_array.each.with_index(1) do |_title, i|
        @@title_array_2 << _title
    end
    
    for j in 1..@@title_array_2.size - 1
        if @@title_array_2[j].strip != ''
        puts "#{j})#{@@title_array_2[j].strip}"
        end
    end 
    puts "------------------------------------------------------------------------------------------------------------------"
    third_menu
end

def third_menu
    puts "Choose a article number to display or type r to return to the previous menu : "
    puts "\n"
    article_number = gets.strip
    if article_number == "r"
        list_news
        main_menu
    else
    link = @@title_array_url[article_number.to_i].strip
    get_article_details(link)
    end
end

def square_equal(text)
    
    for i in 0..text.length + 1
        print "="
    end
    puts "\n"

    print "|"
    puts text + "|"
    # print "|"
    for i in 0..text.length + 1
        print "="
    end

    puts "\n"
end


def get_article_details(link)
    new_link = "https://metropolehaiti.com/"+link
    # puts "New link - #{new_link}"
    details = NoukodProject1::News.scrape_news_details(new_link)
    square_equal(details.details_title)
    # puts "==============================================================================================================================="
    puts details.details_description
    puts "\n"
    puts "------------------------------------------------------------------------------------------------------------------"
    puts "\n"
    puts "Press r to return to the previous menu : "
    key_ = gets.strip
    if key_ == "r"
        second_menu(@news.strip)
    end
    # list_news
    # main_menu
end

def main_menu
    input = nil
    puts "Choose a news type/category to display or type quit to exit : \n"
    while input != "quit" 
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= @menu_array.size
        @news = @menu_array[input.to_i - 1]
        puts "#{@news} : "
        puts "------------------------------------------------------------------------------------------------------------------"
        second_menu(@news.strip)

        puts "Press r to return to the previous menu : "
    key_ = gets.strip
    if key_ == "r"
        list_news
    end
        else
            puts "\n"
        puts "Error, Please choose a valid news type/category to display or type quit to exit : \n"
        puts "\n"
        list_news
        main_menu
    end
end   
end



def goodbye
    puts "See you tomorrow for more deals!!!"
end

end