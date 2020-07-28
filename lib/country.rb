require 'pry'

class Country
    # what other categories do I want to make available? --->> :head_of_state
    attr_reader :name, :capital, :currencies, :population, :languages, :alpha3code, :area, :continent, :borders, :lat_lng, :alt_spellings, :demonym, :gini_index, :timezones, :native_name, :flag
    @@all = []

    def initialize(name=nil, capital=nil, currencies=nil, population=nil, languages=nil, alpha3code=nil, area="N/A", continent=nil, borders=nil, lat_lng=nil, alt_spellings=nil, demonym=nil, gini_index=nil, timezones=nil, native_name=nil, flag=nil)
        @name = name
        @capital = capital
        # @currencies is set to an array of strings that contain the currency name, code, and symbol 
        @currencies = currencies.collect do |currency|
            "#{currency["name"]} (#{currency["code"]} / #{currency["symbol"]})"
        end
        @population = population
        # @languages is set to an array of strings of language names
        @languages = languages.collect do |language|
            "#{language["name"]}"
        end
        @alpha3code = alpha3code
        # exclude units of km^2 ?
        @area = "#{area} km^2"
        @continent = continent
        @borders = borders
        @lat_lng = "latitude: #{lat_lng[0]}, longitude: #{lat_lng[1]}"
        @alt_spellings = alt_spellings
        @demonym = demonym
        @gini_index = gini_index
        @timezones = timezones
        @native_name = native_name
        @flag = flag
        
        
        @@all << self
    end

    def self.all
        @@all
    end

    # .new_from_json assigns countries attributes using the attribute notation in the json object --- Country.new renames some of these attributes (subregion=continent, latlng=lat_lng)
    def self.new_from_json(obj)
        self.new(
            obj["name"],
            obj["capital"],
            obj["currencies"],
            obj["population"],
            obj["languages"],
            obj["alpha3Code"],
            obj["area"],
            obj["subregion"],
            obj["borders"],
            obj["latlng"],
            obj["altSpellings"],
            obj["demonym"],
            obj["gini"],
            obj["timezones"],
            obj["nativeName"],
            obj["flag"]
        )
    end

    # this will be used for finding Countries -- thinking of implementing .include? rather than == to lead to a list of relevant countries
    def self.find_by_name(arg)
        self.all.find do |country|
            country.name.upcase == arg.upcase || country.alt_spellings.upcase == arg.upcase || country.alpha3Code == arg.upcase
        end
    end

    # find matches returns an array of Country instances that match the search term
    def self.find_matches(arg)
        self.all.select do |country|    
            country.name.upcase.include?(arg.upcase) || country.alt_spellings.find {|sp| sp.upcase.include?(arg.upcase)} || country.alpha3code.include?(arg.upcase)
        end
    end

    # this will come into play when traversing borders through the CLI
    def self.find_by_alpha3code(code)
        self.all.find do |country|
            country.alpha3code == code.upcase
        end
    end
    
    def self.display_info(country)

    end

end
