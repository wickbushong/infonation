require 'pry'

class Country
    # what other categories do I want to make available? --->> :languages, :population, :area, :continent, :lat_long, :demonym, :gini_index, :timezones, :borders, :alpha2code, :alpha3code
    attr_accessor :name, :capital 
    attr_reader :currencies
    @@all = []

    def initialize(name=nil, capital=nil, currencies=nil)
        @name = name
        @capital = capital
        @currencies = currencies
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_from_json(obj)
        self.new(
            obj["name"],
            obj["capital"],
            obj["currencies"]
        )
    end

    def currencies=(arr)
        arr.collect do |currency|
            binding.pry
            "#{currency["name"]} (#{currency["code"]} / #{currency["symbol"]})"
        end
    end

    def self.find_by_name(arg)
        self.all.find do |country|
            country.name == arg
        end
    end

end