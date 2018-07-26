class RealEstate::Scraper

    

    def self.scrape_properties
        doc = Nokogiri::HTML(open("http://www.loopnet.com/for-sale/annapolis-md/?e=u"))
        articles = doc.css("article.placard.tier4")
        test_property = articles[0].css("header h4 a")[0]["title"]
        puts test_property
        property_data = articles.map do |article|
            street = article.css("header h4 a")[0]["title"]
            street2 =  article.css("header h6 a")[0]["title"]
            address = "#{street}\n#{street2}"
            data = article.css("div.data ul.data-points li")
            price = data[0].text
            square_feet = data.find do |item|
                item.text.downcase.include?("sf") || item.text.downcase.include?("ac")
            end
            square_feet = square_feet.nil? ? "not found" : square_feet.text


            {address: address, price: price, square_feet: square_feet}
        

        end
        property_data.map do |property_hash|
            property = RealEstate::Property.new
            property_hash.each do |k, v|
                property.send("#{k}=",v)
            end
            property
        end
    end


end