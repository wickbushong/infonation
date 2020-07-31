

class CLI
    include Display

    def initialize
        APIRequest.new.make_countries
    end
    
    def greeting
        puts "/////////////////////////////////////////////"
        puts "/////////////////////////////////////////////"
        puts "///---------Welcome to Infonation---------///"
        puts "/////////////////////////////////////////////"
    end
    

    # TODO: add option to list countries by entering a continent name?
    def run
        puts "/////////////////////////////////////////////"
        puts "To check out some info about a country, enter that country's name (you can also use a 3 letter country code)..."
        puts "If you would like to see a list of available countries enter 'list all'..."
        puts "If you would like to exit the program enter 'exit'..."
        country = country_input
        category_query(country)
    end

    # .country_input takes in an input from the user and checks it for validity, then passes the input to .search_countries
    def country_input
        puts "/////////////////////////////////////////////"
        print "Search: "
        input = gets.chomp.downcase
        # this regex checks for digits and non-word characters (except whitespace)
        if input.split(" ").any?{|word| word.match?(/[\d\W]/)}
            puts "Invalid input. Special characters and digits are not allowed. Try again..."
            country_input
        else
            case input
                # .list_all provides a list of every country, then .country_input is called again
            when "list all", "list", "all"
                list_all
                puts "/////////////////////////////////////////////"
                puts "Enter a name from the list above..."
                country_input
            # "start over" is used once a user is done exploring one country and wants to return to the start of the program
            when "start over"
                run
            # "no" is included for the .display_borders feature, from .display_borders users either enter a country code or "no" which brings them back to .run --- defined? is implemented in case a user inputs "no" before they have reached .display_borders
            when "no"
                if defined?(country)
                    country
                else
                    run
                end
            when "exit", "esc"
                abort "K bye!"
            else
                search_countries(input)
            end
        end
    end

    def search_countries(input)
        matches = Country.find_matches(input)
        puts "/////////////////////////////////////////////"
        if input.length == 3 && matches.length > 1
            match = Country.find_by_alpha3code(input)
            puts "Found:"
            puts "#{match.name}"
            match
        elsif matches.length == 1
            puts "Found:"
            puts "#{matches.first.name}"
            matches.first
        elsif matches.length > 1
            puts "Found:"
            matches.each do |country|
                puts "#{country.alpha3code} - #{country.name}"
            end
            puts "Enter a 3 letter country code from the list above, or enter 'start over'..."
            country_input
        elsif matches.length == 0
            puts "No countries found. Try again..."
            country_input
        end
    end

    def info_display(country)
        print "Search: "
        input = gets.chomp.downcase
    
        case input
        when "exit", "exit!"
            abort "K bye!"
        when "menu"
            country.display_counter = 0
            greeting
            run
        when "all info", "all", "list", "list all"
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
        when "continent", "landmass", "land mass", "region", "subregion", "subcontinent"
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
        category_query(country)
    end

    def list_all
        Country.all.each do |country|
            puts "#{country.name}"
        end
    end

    def category_query(country)
        sleep 1.5
        puts "/////////////////////////////////////////////"
        if country.display_counter == 0
            puts "What would you like to know about #{country.name}?"
        else
            puts "What else would you like to know about #{country.name}?"
        end
        puts "Try: 'population', 'borders', or 'languages'. Alternatively, if you would like to see all of #{country.name}'s info enter 'all info'..."
        puts "To return to the main menu enter 'menu'..."
        puts "/////////////////////////////////////////////"
        info_display(country)
    end
    
end
