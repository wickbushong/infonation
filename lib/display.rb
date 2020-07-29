
module Display

    def display_capital(country)
        puts "#{country.name}'s capital city is: #{country.capital}"
    end

    def display_currencies(country)
        if country.currencies.length == 1
            puts "#{country.demonym} currency:"
            puts "#{country.currencies.first}"
        else
            puts "#{country.name} currencies:"
            country.currencies.each_with_index do |currency, i|
                puts "#{i+1}. #{currency}"
            end
        end
    end

    def display_population(country)

    end

    def display_language(country)
        
    end

    def display_alpha3code(country)
        
    end

    def display_area(country)
        puts "#{country.name} area:"
        puts "#{country.area} km^2, #{country.area.to_f/2.59.round(1)} mi^2"
    end

    def display_continent(country)
        
    end

    def display_borders(country)
        
    end

    def display_lat_lng(country)
        
    end

    def display_alt_spellings(country)
        
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
