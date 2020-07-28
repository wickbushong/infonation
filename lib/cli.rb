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
        binding.pry
        puts "What would you like to know about #{country.name}?"
        sleep 0.5
        puts "Try: 'population', 'borders', or 'languages'. Alternatively, if you would like to see all of #{country.name}'s info enter 'all info'..."
        category = category_input(country)
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

    def category_input(country)
        input = gets.chomp
        case input
        when "all info"
            # display all info
        when "capital" || "capital city"
            dislpay_info(country, capital)
        when "currencies" || "currency"
            puts "#{country.currencies}"
        end
    end

    def list_all
        Country.all.each do |country|
            puts "#{country.name}"
        end
    end

    def dislpay_info(country, category)
        puts "#{country.name}"
        puts "#{category}: #{country.category}"
    end
    
end

cli = CLI.new
cli.run



