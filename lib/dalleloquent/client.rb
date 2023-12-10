require "openai"

module Dalleloquent
  class Client
    def initialize
      @ai = OpenAI::Client.new(access_token: ENV["OPENAPI_KEY"]) do |f|
        f.response :logger, Logger.new($stdout), bodies: true
      end

      # puts "Here's a list of available models:"

      # available_models.each do |model|
      #   puts "* #{model["id"]}"
      # end
    end

    def available_models
      @ai.models.list["data"].sort_by{|a| -a["created"]}
    end

    def generate_image(prompt:, size: 1024, style: "natural")
      response = @ai.images.generate(
        parameters: {
          prompt: prompt,
          size: "#{size}x#{size}",
          n: 1,
          model: "dall-e-3",
          style: style
        }
      )
      response.dig("data", 0, "url")
    end
  end
end