require 'pry'
require_relative './api_request.rb'
require_relative './country.rb'

class CLI

    def initialize
        APIrequest.new.make_countries
    end
    
    def greeting
        puts "------------Welcome to Infonation------------"
        puts "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
        sleep 1
    end
    
    def run
        puts "If you would like to explore a country's information, enter that country's name (you can also use a 3 letter code)..."
        puts "If you would like to see a list of available countries enter 'list'"
        receive_input
    end

    def receive_input
        input = gets.chomp
        if input.downcase == "list"
            list_countries
        else
            search_countries(input)
        end
    end

    def list_countries
        
    end

    def search_countries(input)
        matches = Country.find_matches(input)
        if matches.length == 1
            puts "Found:"
            puts "#{matches.first.name}"
            matches.first.name
        elsif matches.length > 1
            puts "Found:"
            matches.each do |country|
                puts "#{country.name}"
            end
            puts "Enter a name from the list, or enter 'start over'"

        end
    end

    def display_country(name)

    end
    
end
