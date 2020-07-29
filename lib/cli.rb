require 'pry'
require_relative './api_request.rb'
require_relative './country.rb'
require_relative './display.rb'

class CLI
    include Display

    def initialize
        APIRequest.new.make_countries
    end
    
    def greeting
        puts "------------Welcome to Infonation------------"
        puts "/////////////////////////////////////////////"
    end
    

    # TODO: add option to list countries by entering a continent name?
    def run
        puts "/////////////////////////////////////////////"
        puts "If you would like to explore a country's information, enter that country's name (you can also use a 3 letter country code)..."
        sleep 0.5
        puts "If you would like to see a list of available countries enter 'list all'..."
        sleep 0.5
        puts "If you would like to exit the program enter 'exit'..."
        country = country_input
        category_query(country)
    end

    def country_input
        input = gets.chomp.downcase
        puts "/////////////////////////////////////////////"
        case input
        when "list all", "list", "all"
            list_all
            puts "/////////////////////////////////////////////"
            puts "Enter a name from the list above..."
            country_input
        when "start over"
            run
        when "no"
            if defined?(country)
                country
            else
                run
            end
        when "exit", "exit!"
            abort "K bye!"
        else
            search_countries(input)
        end
    end

    def search_countries(input)
        matches = Country.find_matches(input)
        puts "/////////////////////////////////////////////"
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
        when "exit", "exit!"
            abort "K bye!"
        when "menu"
            greeting
            run
        when "all info"
            display_all(country)
        when "capital", "capital city"
            display_capital(country)
        when "currencies", "currency"
            display_currencies(country)
        when "population", "pop"
            display_population(country)
        when "language", "languages"
            display_language(country)
        when "alpha3code", "country code", "alpha 3 code", "code"
            display_alpha3code(country)
        when "area", "size"
            display_area(country)
        when "continent", "landmass", "land mass", "region", "subregion"
            display_continent(country)
        when "borders", "border", "bordering countries", "neighbors", "neighboring countries"
            display_borders(country)
        when "coordinates", "gps", "latitude", "longitude", "latitude and longitude", "location"
            display_lat_lng(country)
        when "alternative spelling", "spellings", "spelling"
            display_alt_spellings(country)
        when "demonym"
            display_demonym(country)
        when "gini", "gini index", "inequality"
            display_gini(country)
        when "timezone", "timezones", "time"
            display_timezone(country)
        when "native name", "local name"
            display_native_name(country)
        when "flag", "banner"
            display_flag(country)
        when "domain", "top level domain", "domain code", "top level domain code"
            display_domain(country)
        when "phone code", "calling code", "area code", "dial code", "dialing code"
            display_calling_codes(country)
        else
            puts "Invalid input. Try again..."
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





