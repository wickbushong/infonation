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
                name: obj["name"],
                capital: obj["capital"],
                currencies: obj["currencies"].collect {|currency|
                    "#{currency["name"]} (#{currency["code"]} / #{currency["symbol"]})"},
                population: obj["population"],
                languages: obj["languages"].collect {|language| "#{language["name"]}"},
                alpha3code: obj["alpha3Code"],
                area: "#{obj["area"]} km^2, #{obj["area"].to_f/2.59} mi^2",
                continent: obj["subregion"],
                borders: obj["borders"],
                lat_lng: obj["latlng"],
                alt_spellings: obj["altSpellings"],
                demonym: obj["demonym"],
                gini: obj["gini"],
                timezones: obj["timezones"],
                native_name: obj["nativeName"],
                flag: obj["flag"]
            }
            binding.pry
            Country.new(country_hash)
        end
    end


end


APIRequest.new.make_countries

