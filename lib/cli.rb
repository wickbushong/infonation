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
        puts "If you would like to explore a country's information, enter that country's name (you can also use a 3 letter code)..."
        puts "If you would like to see a list of available countries enter 'list all'..."
        puts "If you would like to exit the program enter 'exit'..."
        country = country_input
        puts "What would you like to know about #{country.name}?"
        puts "Try: 'population', 'borders', or 'languages'. Alternatively, if you would like to see all of #{country.name}'s info enter 'all'..."
        
    end

    def country_input
        input = gets.chomp
        if input.downcase == "list all"
            Country.list_all
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
        puts "/////////////////////////////////////////////"
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

    def display_country(name)

    end
    
end

cli = CLI.new

binding.pry
