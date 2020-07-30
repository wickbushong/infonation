
module Display
    @@categories = ["Name", "Alpha 3 Code", "Capital", "Currencies", "Population", "Languages", "Area", "Landmass", "Subcontinent", "Borders", "Latitude", "Longitude", "Alternative Spellings", "Demonym", "Gini Index", "Timezone", "Native Name", "Flag"]
    # TODO: make N/A outputs for each display

    def display_capital(country)
        puts "#{country.name}'s capital city is: #{country.capital}"
    end

    def display_currencies(country)
        if country.currencies.length == 1
            puts "The #{country.demonym} currency is the #{country.currencies.first}"
        else
            # TODO: rewrite to read naturally
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
            country.languages.each_with_index {|language, i| puts "#{i+1}. #{language}"}
        end
    end

    def display_alpha3code(country)
        puts "#{country.name} alpha-3-code:"
        puts "#{country.alpha3code}"
    end

    def display_area(country)
        puts "#{country.name} area:"
        puts "#{country.area} km^2, #{(country.area.to_f/2.59).round(1)} mi^2"
    end

    def display_continent(country)
        puts "#{country.name} is situated in #{country.sub_region} (a subcontinent of #{country.region})."
    end

    def display_borders(country)
        if country.borders != nil
            puts "#{country.name} shares a border with:"
            country.borders.each {|border| puts "#{border} - #{Country.find_by_alpha3code(border).name}"}
            puts "Is there a border country you would like to know more about? If so, enter the country code or the country name. If not, enter 'no'..."
            new_input = gets.chomp.downcase
            # TODO: invalid input for non-border countries
            if new_input == "no" || new_input == "n"
                category_query(country)
            else
                category_query(search_countries(new_input))
            end
        else
            puts "No listed bordering nations available for #{country.name}"
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
            country.alt_spellings.each {|sp| puts "#{sp}"}
        end
    end

    def display_demonym(country)
        puts "The #{country.demonym} demonym is: #{country.demonym}"
    end

    def display_gini(country)
        puts "#{country.name} Gini index:"
            puts "#{country.gini_index}"
            puts "The Gini index measures income inequality on a scale from 0-100. Read more about it here: https://en.wikipedia.org/wiki/Gini_coefficient"
            sleep 1
    end

    def display_timezone(country)
        if country.timezones.length == 1
            puts "The #{country.demonym} timezone is #{country.timezones.first}"
        else
            puts "#{country.name} spans these timezones:"
            country.timezones.each {|zone| puts "#{zone}"}
        end
    end

    def display_native_name(country)
        puts "The native name of #{country.name} is '#{country.native_name}'"
    end

    def display_flag(country)
        puts "To see the #{country.demonym} flag, visit: #{country.flag}"
    end

    def display_domain(country)
        if country.domain.length > 1
            puts "#{country.name} has a few country code top-level domains. They are as follows:"
            country.domain.each_with_index {|domain, i| puts "#{i+1}. #{domain}"}
        else
            puts "The #{country.demonym} country code top-level domain is #{country.domain.first}"
        end
    end

    def display_calling_codes(country)
        if country.calling_codes.length > 1
            puts "#{country.name} has a few calling codes. They are as follows:"
            country.calling_codes.each_with_index {|code, i| puts "#{i+1}. +#{code}"}
        else
            puts "The #{country.demonym} calling code domain is #{country.calling_codes.first}"
        end
    end

    def display_all(country)
        puts "Name: #{country.name}"
        puts "Alpha 3 Code: #{country.alpha3code}"
        puts "Capital: #{country.capital}"
        print "Currencies: "; country.currencies.each_with_index {|c, i| if i == country.currencies.length - 1; puts "#{c}"; else; print "#{c}, ";end}
        puts "Population: #{country.population} people"
        print "Languages: "; country.languages.each_with_index {|l, i| if i == country.languages.length - 1; puts "#{l}"; else; print "#{l}, ";end}
        puts "Area: #{country.area} km^2, #{(country.area.to_f/2.59).round(1)} mi^2"
        puts "Continent: #{country.region}"
        puts "Subcontinent: #{country.sub_region}"
        print "Bordering Nations: "; country.borders.each_with_index {|b, i| if i == country.borders.length - 1; puts "#{b}"; else; print "#{b}, ";end}
        puts "Latitude: #{country.lat}"
        puts "Longitude: #{country.lng}"
        print "Alternative Spellings: "; country.alt_spellings.each_with_index {|sp, i| if i == country.alt_spellings.length - 1; puts "#{sp}"; else; print "#{sp}, ";end}
        puts "Demonym: #{country.demonym}"
        puts "Gini Index: #{country.gini_index}"
        print "Timezone: "; country.timezones.each_with_index {|t, i| if i == country.timezones.length - 1; puts "#{t}"; else; print "#{t}, ";end}
        puts "Native Name: #{country.native_name}"
        puts "Flag: #{country.flag}"
        print "Top-level Domain: "; country.domain.each_with_index {|d, i| if i == country.domain.length - 1; puts "#{d}"; else; print "#{d}, ";end}
        print "Calling Codes: "; country.calling_codes.each_with_index {|c, i| if i == country.calling_codes.length - 1; puts "#{c}"; else; print "#{c}, ";end}
    end
    
end
