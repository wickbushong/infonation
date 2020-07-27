require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class APIRequest
    
    def request
        # CURRENT URL: requests info for every country available but filters out everything except name, capital, and currencies (for practice sake)
        url = 'https://restcountries.eu/rest/v2/all?fields=name;capital;currencies'


        uri = URI.parse(url)

        #net/http sends the actual request to the RESTcountry API and receives the response
        response = Net::HTTP.get_response(uri)

        #JSON parses the response body and returns the API response in JSON -- it will be easier to instantiate instances of Country
        JSON.parse(response.body)
    end

end

# country = APIRequest.new.request
# binding.pry
