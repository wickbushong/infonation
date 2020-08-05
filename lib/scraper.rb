# require 'pry'
# require 'nokogiri'
# require 'open-uri'


# class Scraper

#     def retrieve
#         html = open("https://www.worldometers.info/coronavirus/")

#         doc = Nokogiri::HTML(html)

#         binding.pry
#         doc
#     end

#     def add_attribute
#         retrieve.css(".mt_a").each do |element|

#         end
#     end

# end

# Scraper.new.retrieve