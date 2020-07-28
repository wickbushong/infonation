require 'pry'

class Country
    # what other categories do I want to make available? --->> :demonym, :gini_index, :timezones, :alpha2code, :alt_spellings
    attr_reader :name, :capital, :currencies, :population, :languages, :alpha3code, :area, :continent, :borders, :lat_lng
    @@all = []

    def initialize(name=nil, capital=nil, currencies=nil, population=nil, languages=nil, alpha3code=nil, area=nil, continent=nil, borders=nil, lat_lng=nil)
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
        @lat_lng = lat_lng
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
            obj["latlng"]
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
