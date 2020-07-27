require 'net/http'
require 'open-uri'
require 'json'

class APIRequest

    def request(url)
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

end

country = APIRequest.new.request('https://restcountries.eu/rest/v2/name/united')
binding.pry
puts country