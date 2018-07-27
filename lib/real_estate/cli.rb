class RealEstate::CLI
    def call
        RealEstate::Property.today
        puts "Today's Properties:"
        list_properties
        menu
        goodbye
     end

    def list_properties
       
        # puts <<-DOC
        #     1. 2100 Renard Ct - $325,000 - 1508 Square_Feet
        #     2. 115 Hudson St - $285,000 - 1622 Square_Feet
        # DOC
        properties = RealEstate::Property.all
        properties.each.with_index(1) do |property, i|
            puts "#{i}. #{property.address}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the city of the properties you are interested or type exit:"
            input = gets.strip.downcase
            index = input.to_i - 1
            if index > 0
                property = RealEstate::Property.all[index]
                puts "#{property.address} - #{property.price}"
            elsif input == "list"
                list_properties
            else
                puts "Not sure which property you're interested in, type list or exit"
            end
        end
    end

    def goodbye
        puts "Come back later for more properties"
    end



end


#next method should allow user to select from the list of properties a "city" and have a list of properties in
#that city returned



# doc = Nokogiri::HTML(open("http://www.loopnet.com/for-sale/annapolis-md/?e=u"))