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
        input = gets.chomp
        if input.downcase == "list all"
            list_all
            puts "Enter a name from the list above..."
            country_input
        elsif input.downcase == "start over"
            run
        elsif input.downcase == "exit"
            puts "K bye!"
            # insert exit function??
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
        when "all info"
            # display all info
        when "capital" || "capital city"
            puts "#{country.name} capital:"
            puts "#{country.capital}"
        when "currencies" || "currency"
            puts "#{country.name} currencies:"
            puts "#{country.currencies}"
        when "population" || "pop"
            puts "#{country.name} population:"
            puts "#{country.population}"
        when "language" || "languages"
            puts "#{country.name} languages:"
            puts "#{country.languages}"
        when "alpha3code" || "country code" || "alpha 3 code" || "code"
            puts "#{country.name} alpha-3-code:"
            puts "#{country.alpha3code}"
        when "area" || "size"
            puts "#{country.name} area:"
            puts "#{country.area}"
        when "continent" || "landmass" || "land mass"
            puts "#{country.name} continent:"
            puts "#{country.continent}"
        when "borders" || "border" || "bordering countries"
            puts "#{country.name} bordering countries:"
            binding.pry
            country.borders.each do |border|
                puts "#{border} - #{Country.find_by_alpha3code(border).name}"
            end
            puts "Is there a border country you would like to know more about? If so, enter the country code or the country name. If not, enter 'no'..."
            category_query(country_input)
        end
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
        info_display(country)
    end
    
end

cli = CLI.new
cli.run



