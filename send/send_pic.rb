require 'net/http'
require 'uri'
require 'json'
require 'base64'
require 'benchmark'

uri = URI.parse("https://other-projects-lokeshh.c9users.io/shop/1")

header = {'Content-Type': 'application/json'}
pic = {
	data:  Base64.encode64(File.open('pic.jpeg').read)
       }

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = pic.to_json

puts Benchmark.measure {
	# Send the request
	response = http.request(request)
	print response
}