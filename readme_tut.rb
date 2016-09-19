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

pp page
# when we print the page we see that the form is named 'f'
# {forms
  #<Mechanize::Form
  # {name "f"}
# with that name of the form we can grab it
google_form = page.form( 'f' )

# Mechanize lets you access form input fields in a few different ways, but the most convenient is that you can access input fields as accessors on the object. So let's set the form field named 'q' on the form to 'ruby mechanize':
google_form.q = 'ruby mechanize'


# we can now submit the form and 'press' the submit button and print the results

page = agent.submit(google_form, google_form.buttons.first)
pp page

# FINDING LINKS
# the *link lists all the links on the page
## page.links.each do | link |

##	puts link.text

## end

# if we want to find a link to click on, we can type this
## page = agent.page.link_with(:text => 'News').click

# if there are multiple 'news' links and you want the 2nd one, you write this
## agent.page.links_with(:text => 'News')[1].click

# or find a link with a specific href
## page.link_with(:href => '/something')

# or chaing them together to find a link with a certain text and href
## page.link_with(:text => 'News', :href => '/something')


# FILLING OUT FORMS

