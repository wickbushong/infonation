require 'pry'

class Country
    # what other categories do I want to make available? --->> :area, :continent, :lat_long, :demonym, :gini_index, :timezones, :borders, :alpha2code
    attr_accessor :name, :capital, :currencies, :population, :languages, :alpha3code
    @@all = []

    def initialize(name=nil, capital=nil, currencies=nil, population=nil, languages=nil, alpha3code=nil)
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
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_from_json(obj)
        self.new(
            obj["name"],
            obj["capital"],
            obj["currencies"],
            obj["population"],
            obj["languages"],
            obj["alpha3code"]
        )
    end

    def self.find_by_name(arg)
        self.all.find do |country|
            country.name == arg
        end
    end

    def self.find_by_alpha3code(code)
        self.all.find do |country|
            country.alpha3code == code
        end
    end

end
