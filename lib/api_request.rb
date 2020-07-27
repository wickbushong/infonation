require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class APIRequest
    
    def request
        # CURRENT URL: requests info for every country available but filters out everything except name, capital, and currencies (will add more attributes)
        url = 'https://restcountries.eu/rest/v2/all?fields=name;capital;currencies'


        uri = URI.parse(url)

        #net/http sends the actual request to the RESTcountry API and receives the response
        response = Net::HTTP.get_response(uri)

        #returns data in raw form
        response.body
    end

    def to_json
        #JSON parses the response body and returns the API response in JSON -- it will be easier to instantiate instances of Country
        JSON.parse(self)
    end

    def make_countries
        request.each do |country|

        end
    end
end

countries = APIRequest.new.request
binding.pry
