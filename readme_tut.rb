require	'mechanize'
require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'pry'


# first we instantiate a new mechanize object
agent = Mechanize.new

# use the new object to fetch a page
# with this get command, mechanize picked up google's home page and stored any cookies that were set and followed any redirects that were sent, the resulting page we scrap for links, forms etc
page = agent.get( "http://google.com/" )

# FINDING LINKS
# the *link lists all the links on the page
page.links.each do | link |

	puts link.text

end