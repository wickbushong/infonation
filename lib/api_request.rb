require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

require_relative './country.rb'

class APIRequest
    
    def request
        # CURRENT URL: requests info for every country
        url = 'https://restcountries.eu/rest/v2/all'


        uri = URI.parse(url)

        #net/http sends the actual request to the RESTcountry API and receives the response
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
            country_hash = {
                # TODO: refactor name to filter out and reformat parantheses, etc.
                name: obj["name"],
                capital: obj["capital"],
                # :currencies is set to an array of strings that contain the currency name, code, and symbol 
                currencies: obj["currencies"].collect {|currency|
                    "#{currency["name"]} (#{currency["code"]} / #{currency["symbol"]})"},
                population: obj["population"],
                # :languages is set to an array of strings of language names
                languages: obj["languages"].collect {|language| "#{language["name"]}"},
                alpha3code: obj["alpha3Code"],
                area: obj["area"],
                region: obj["region"],
                sub_region: obj["subregion"],
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