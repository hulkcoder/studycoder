require 'webrick'
require 'securerandom'

server = WEBrick::HTTPServer.new :Port => 80

#Return a successful Hello World response.
server.mount_proc '/' do |request, response|
  response.body = 'Hello, world!'
  sleep 0.125 + SecureRandom.random_number*0.250
end

#Return an error to help demonstrate monitoring capabilities
server.mount_proc '/error' do |request, response|
  response.status = 500
  response.body = 'Sorry we encountered an error.'
  sleep 1.0+SecureRandom.random_number
end

server.start