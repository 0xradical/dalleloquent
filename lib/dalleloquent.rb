require "dotenv"
Dotenv.load

module Dalleloquent; end

require_relative "dalleloquent/client"

module Dalleloquent
  def self.run
    print "Running Dalleloquent."
    if ENV["OPENAPI_KEY"]
      puts "You're all setup!"
    else
      puts "You haven't configured your OpenAPI credentials"
    end

    client = Dalleloquent::Client.new

    # puts client.generate_image(
    #   prompt: "An image of someone falling off a stool"
    # )

    # client.generate_response(prompt: %(
    #   Give me the 100 most common idioms, expressions or phrases in English that are useful and are
    #   constantly used professional settings, especially in the tech industry, in json format. Return the
    #   expression and also the explanation for this expression
    # ), model: "gpt-3.5-turbo-1106", format: :json)

    client.generate_response(prompt: %(
      Give me the 100 most common idioms, expressions or phrases in English that are useful and are
      constantly used professional settings, especially in the tech industry, in json format. Return the
      expression and also the explanation for this expression
    ), model: "gpt-4-1106-preview", format: :json)
  end
end
