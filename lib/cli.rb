require 'pry'
require_relative './api_request.rb'
require_relative './country.rb'

class CLI

    def initialize
        APIRequest.new.make_countries
    end
    
    def greeting
        puts "------------Welcome to Infonation------------"
        puts "/////////////////////////////////////////////"
        sleep 1
    end
    
    def run
        puts "If you would like to explore a country's information, enter that country's name (you can also use a 3 letter country code)..."
        puts "If you would like to see a list of available countries enter 'list all'..."
        puts "If you would like to exit the program enter 'exit'..."
        country = country_input
        category_query(country)
    end

    def country_input
        input = gets.chomp.downcase
        case input
        when "list all", "list", "all"
            list_all
            puts "Enter a name from the list above..."
            country_input
        when "start over"
            run
        when "no"
            country
        when "exit"
            abort "K bye!"
        else
            search_countries(input)
        end
    end

    def search_countries(input)
        matches = Country.find_matches(input)
        if matches.length == 1
            puts "Found:"
            puts "#{matches.first.name}"
            matches.first
        elsif matches.length > 1
            puts "Found:"
            matches.each do |country|
                puts "#{country.name}"
            end
            puts "Enter a name from the list above, or enter 'start over'..."
            country_input
        end
    end

    def info_display(country)
        input = gets.chomp.downcase
        case input
        when "exit"
            abort "K bye!"
        when "menu"
            greeting
            run
        when "all info"
            # display all info
        when "capital", "capital city"
            puts "#{country.name} capital:"
            puts "#{country.capital}"
        when "currencies", "currency"
            puts "#{country.name} currencies:"
            puts "#{country.currencies}"
        when "population", "pop"
            puts "#{country.name} population:"
            puts "#{country.population}"
        when "language", "languages"
            puts "#{country.name} languages:"
            puts "#{country.languages}"
        when "alpha3code", "country code", "alpha 3 code", "code"
            puts "#{country.name} alpha-3-code:"
            puts "#{country.alpha3code}"
        when "area", "size"
            puts "#{country.name} area:"
            puts "#{country.area}"
        when "continent", "landmass", "land mass"
            puts "#{country.name} continent:"
            puts "#{country.continent}"
        when "borders", "border", "bordering countries"
            puts "#{country.name} bordering countries:"
            country.borders.each do |border|
                puts "#{border} - #{Country.find_by_alpha3code(border).name}"
            end
            puts "Is there a border country you would like to know more about? If so, enter the country code or the country name. If not, enter 'no'..."
            new_input = gets.chomp.downcase
            if new_input == "no" || new_input == "n"
                category_query(country)
            else
                category_query(search_countries(new_input))
            end
        when "coordinates", "GPS", "latitude", "longitude", "latitude and longitude"
            puts "#{country.name}"
            puts "latitude: #{country.lat_lng[0]}, longitude: #{country.lat_lng[1]}"
        when "alternative spelling", "spellings"
            puts "#{country.name} alternative spellings:"
            country.alt_spellings.each do |sp|
                puts "#{sp}"
            end
        when "demonym"
            puts "#{country.name} demonym:"
            puts "#{country.demonym}"
        when "gini", "gini index"
            puts "#{country.name} Gini index:"
            puts "#{country.gini_index}"
            puts "The Gini index measures income inequality on a scale from 0-100. Read more about it here: https://en.wikipedia.org/wiki/Gini_coefficient"
        when "timezone", "timezones", "time"
            puts "#{country.name} timezones:"
            country.timezones.each do |zone|
                puts "#{zone}"
            end
        when "native name", "local name"
            puts "#{country.name} native name:"
            puts "#{country.native_name}"
        when "flag", "banner"
            puts "#{country.name} flag:"
            puts "Visit: #{country.flag}"
        end
        sleep 1
        puts "/////////////////////////////////////////////"
        category_query(country)
    end

    def list_all
        Country.all.each do |country|
            puts "#{country.name}"
        end
    end

    def category_query(country)
        sleep 0.5
        puts "What would you like to know about #{country.name}?"
        puts "Try: 'population', 'borders', or 'languages'. Alternatively, if you would like to see all of #{country.name}'s info enter 'all info'..."
        puts "To return to the main menu enter 'menu'..."
        puts "/////////////////////////////////////////////"
        info_display(country)
    end
    
end

cli = CLI.new
cli.greeting
cli.run



