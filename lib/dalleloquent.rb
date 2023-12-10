require 'dotenv'
Dotenv.load

module Dalleloquent; end

require_relative "./dalleloquent/client"

module Dalleloquent
  def self.run
    print "Running Dalleloquent."
    if ENV["OPENAPI_KEY"]
      puts "You're all setup!"
    else
      puts "You haven't configured your OpenAPI credentials"
    end

    client = Dalleloquent::Client.new

    puts client.generate_image(
      prompt: "An image of someone falling off a stool"
    )
  end
end