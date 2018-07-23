class RealEstate::CLI
    def call
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
        @properties = RealEstate::Property.today
        @properties.each.with_index(1) do |property, i|
            puts "#{i}. #{property.address} - #{property.price}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter then number of the property you see more details about or typle list to see the properties again or type exit:"
            input = gets.strip.downcase

            if input.to_i > 0
                the_property = @properties[input.to_i-1]
                puts "#{the_property.address} - #{the_property.price}"
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

# doc = Nokogiri::HTML(open("http://www.loopnet.com/for-sale/annapolis-md/?e=u"))