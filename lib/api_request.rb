require 'net/http'
require 'open-uri'
require 'json'
require 'pry'


class APIRequest
    
    def request
        # URL: requests info for every country
        url = 'https://restcountries.eu/rest/v2/all'


        uri = URI.parse(url)

        #net/http .get_response sends a data request to the RESTcountry API and receives the response
        response = Net::HTTP.get_response(uri)

        #returns data in raw form
        response.body
    end

    def to_json
        #JSON parses the response body and returns the API response in JSON -- it will be easier to instantiate instances of Country
        JSON.parse(self.request)
    end

    def make_countries
        to_json.each do |obj|
            # this handles country names that are formatted like: "Congo (Democratic Republic of the)", or "Tanzania, United Republic of"
            if obj["name"].match?(/[\(,]/)
                arr = obj["name"].split(/\s\(|,\s/)
                if arr[1].include?("of") || arr[1].include?("the")
                    arr[0], arr[1] = arr[1].gsub(")", ""), arr[0]
                    obj["name"] = arr.join(" ")
                end
            end

            country_hash = {
                name: obj["name"],
                capital: obj["capital"],
                # :currencies is formatted as an array of strings that contains the currency name, code, and symbol 
                currencies: obj["currencies"].collect {|currency|
                    "#{currency["name"]} (#{currency["code"]} / #{currency["symbol"]})"},
                population: obj["population"],
                # :languages is formatted as an array of strings of language names
                languages: obj["languages"].collect {|language| "#{language["name"]}"},
                alpha3code: obj["alpha3Code"],
                area: obj["area"],
                region: obj["region"],
                sub_region: obj["subregion"],
                # :borders is formatted as an array of strings of border alpha3codes
                borders: obj["borders"],
                lat: obj["latlng"][0],
                lng: obj["latlng"][1],
                alt_spellings: obj["altSpellings"],
                demonym: obj["demonym"],
                gini_index: obj["gini"],
                timezones: obj["timezones"],
                native_name: obj["nativeName"],
                flag: obj["flag"],
                domain: obj["topLevelDomain"],
                calling_codes: obj["callingCodes"]
            }
            
            Country.new(country_hash)
        end
    end


end

