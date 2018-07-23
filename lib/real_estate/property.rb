class RealEstate::Property
    attr_accessor :address, :price, :square_feet, :build_year, :url

    def self.today
        self.scrape_properties
    end

    def self.scrape_properties
        properties = []

        properties << self.scrape_loopnet
        


        properties
    end

    def self.scrape_loopnet
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


        # I should return a bunch of properties

        # puts <<-DOC
        #     1. 2100 Renard Ct - $325,000 - 1508 Square_Feet
        #     2. 115 Hudson St - $285,000 - 1622 Square_Feet
        # DOC

        #go to loopnet, find properties
        #extract property data
        #instantiate a property





    #     property_1 = self.new
    #     property_1.address = "2100 Renard Ct"
    #     property_1.price = "$325,000"
    #     property_1.square_feet = "1508"
    #     property_1.url = "http://www.loopnet.com/Listing/2100-2118-Renard-Ct-Annapolis-MD/13021586/"

    #     property_2 = self.new
    #     property_2.address = "115 Hudson St"
    #     property_2.price = "$285,000"
    #     property_2.square_feet = "1622"
    #     property_2.url = "http://www.loopnet.com/Listing/115-Hudson-St-Annapolis-MD/13021580/"

    #     [property_1, property_2]


    # end
    


end