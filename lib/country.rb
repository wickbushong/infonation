require 'pry'

class Country
    # TODO: what other categories do I want to make available? --->> :head_of_state, :gdp, :sub_region
    attr_accessor :name, :capital, :currencies, :population, :languages, :alpha3code, :area, :region, :sub_region, :borders, :lat, :lng, :alt_spellings, :demonym, :gini_index, :timezones, :native_name, :flag
    @@all = []

    def initialize(hash)
        hash.each {|key, value| self.send(("#{key}="), value)}

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
