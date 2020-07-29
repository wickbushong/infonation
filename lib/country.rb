require 'pry'

class Country
    # what other categories do I want to make available? --->> :head_of_state
    attr_reader :name, :capital, :currencies, :population, :languages, :alpha3code, :area, :continent, :borders, :lat_lng, :alt_spellings, :demonym, :gini_index, :timezones, :native_name, :flag
    @@all = []

    def initialize(hash)
        @name = hash[:name]
        @capital = hash[:capital]
        @currencies = hash[:currencies]
        @population = hash[:population]
        @languages = hash[:languages]
        @alpha3code = hash[:alpha3code]
        @area = hash[:area]
        @continent = hash[:continent]
        @borders = hash[:borders]
        @lat_lng = hash[:lat_lng]
        @alt_spellings = hash[:alt_spellings]
        @demonym = hash[:demonym]
        @gini_index = hash[:gini_index]
        @timezones = hash[:timezones]
        @native_name = hash[:native_name]
        @flag = hash[:flag]
        
        @@all << self
    end

    def self.all
        @@all
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

    # this comes into play when traversing borders through the CLI
    def self.find_by_alpha3code(code)
        self.all.find do |country|
            country.alpha3code == code.upcase
        end
    end

end
