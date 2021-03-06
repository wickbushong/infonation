
class Country
    # TODO: what other categories do I want to make available? --->> :head_of_state, :gdp, :covid_cases
    attr_accessor :name, :capital, :currencies, :population, :languages, :alpha3code, :area, :region, :sub_region, :borders, :lat, :lng, :alt_spellings, :demonym, :gini_index, :timezones, :native_name, :flag, :domain, :calling_codes, :covid_cases
    @@all = []

    def initialize(hash)
        hash.each {|key, value| self.send(("#{key}="), value)}
        
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_matches(arg)
        self.all.select do |country|    
            country.name.upcase.include?(arg.upcase) || country.alt_spellings.include?(arg.upcase) || country.alpha3code == arg.upcase
        end
    end

    def self.find_by_alpha3code(code)
        self.all.find do |country|
            country.alpha3code == code.upcase
        end
    end

    def google_maps_link
        formatted = self.name.gsub(" ", "+")
        "https://www.google.com/maps/place/#{formatted}"
    end

end
