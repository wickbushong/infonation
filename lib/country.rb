

class Country
    # TODO: what other categories do I want to make available? --->> :head_of_state, :gdp, :sub_region
    attr_accessor :name, :capital, :currencies, :population, :languages, :alpha3code, :area, :region, :sub_region, :borders, :lat, :lng, :alt_spellings, :demonym, :gini_index, :timezones, :native_name, :flag, :domain, :calling_codes, :display_counter
    @@all = []

    def initialize(hash)
        hash.each {|key, value| self.send(("#{key}="), value)}

        @display_counter = 0
        @@all << self
    end

    def self.all
        @@all
    end

    # .find_matches returns an array of Country instances that match the search term
    def self.find_matches(arg)
        self.all.select do |country|    
            country.name.upcase == arg.upcase || country.alt_spellings.include?(arg.upcase) || country.alpha3code == arg.upcase
        end
    end

    # this comes into play when traversing borders through the CLI
    def self.find_by_alpha3code(code)
        self.all.find do |country|
            country.alpha3code == code.upcase
        end
    end

end
