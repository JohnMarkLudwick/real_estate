class RealEstate::Property
    attr_accessor :address, :price, :square_feet, :build_year, :url

    @@all = []

    def initialize
        @@all << self

    end

    def self.all
        @@all
    end

    def self.today
        RealEstate::Scraper.scrape_properties
    end

    def self.cities
        
    end


end




#Create method cities -- returns an array of all city names. 

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
    


