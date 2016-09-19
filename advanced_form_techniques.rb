require	'mechanize'
require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'pry'


agent = Mechanize.new


page = agent.get( "http://google.com/" )

pp page

# selecting an option on a list
form.field_with(:name => 'list').options[0].select

# checking a specific buton/box
form.checkbox_with(:name => 'box').check

# radion button checking = they know how to uncheck other radios with the same name
form.radiobuttons_with(:name => 'box')[1].check

# uploading files
form.file_uploads.first.file_name = "somefile.jpg"

# scraping with nokogiri
agent.get('http://someurl.com/').search("p.posted")
