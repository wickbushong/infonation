
module Display

    # TODO: make N/A outputs for each display

    def display_capital(country)
        puts "#{country.name}'s capital city is: #{country.capital}"
    end

    def display_currencies(country)
        if country.currencies.length == 1
            puts "#{country.demonym} currency:"
            puts "#{country.currencies.first}"
        else
            puts "#{country.name} currencies:"
            country.currencies.each_with_index {|currency, i| puts "#{i+1}. #{currency}" }
        end
    end

    def display_population(country)
        puts "#{country.name} current population:"
        puts "#{country.population} people"
    end

    def display_language(country)
        if country.languages.length == 1
            puts "The primary language spoken in #{country.name} is #{country.languages.first}"
        else
            puts "There are #{country.languages.length} languages commonly spoken in #{country.name}. They are as follows:"
            country.languages.each_with_index do |language, i|
                puts "#{i+1}. #{language}"
            end
        end
    end

    def display_alpha3code(country)
        puts "#{country.name} alpha-3-code:"
        puts "#{country.alpha3code}"
    end

    def display_area(country)
        puts "#{country.name} area:"
        puts "#{country.area} km^2, #{country.area.to_f/2.59.round(1)} mi^2"
    end

    def display_continent(country)
        puts "#{country.name} is situated in #{country.sub_region} (a subcontinent of #{country.region})."
    end

    def display_borders(country)
        if country.borders != nil
            puts "#{country.name} shares a border with:"
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
        else
            puts "No listed borders available for #{country.name}"
        end
    end

    def display_lat_lng(country)
        puts "#{country.name} geographic coordinates:"
        puts "latitude: #{country.lat}, longitude: #{country.lng}"
        puts "Check it out on Google Maps here: https://maps.google.com/?q=#{country.lat},#{country.lng}"
    end

    def display_alt_spellings(country)
        if country.alt_spellings.length == 1
            puts "#{country.name} is also sometimes spelled: #{country.alt_spellings.first}"
        elsif country.alt_spellings.length > 1
            puts "There are a few ways to spell #{country.name}. Here are some alternative spellings:"
            country.alt_spellings.each do |sp|
                puts "#{sp}"
            end
        end
    end

    def display_demonym(country)
        
    end

    def display_gini(country)
        
    end

    def display_timezone(country)
        
    end

    def display_native_name(country)
        
    end

    def display_flag(country)
        
    end

    def display_all(country)
    
    end
    
end
