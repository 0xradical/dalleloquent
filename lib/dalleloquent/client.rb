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
      @ai.models.list["data"].sort_by { |a| -a["created"] }
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

    # https://platform.openai.com/docs/api-reference/chat/create
    def generate_response(prompt:, model: "gpt-4-1106-preview", format: :plain)
      if prompt.nil? || prompt.to_s.length < 10
        raise "Prompt should be at least 10 characters long"
      end

      if format == :json && !%w[gpt-4-1106-preview gpt-3.5-turbo-1106].include?(model)
        raise "#{model} is not compatible with json mode"
      end

      if format == :json && !prompt.match(/json/i)
        raise "Prompt should contain the word `json` in some form in json mode"
      end

      response = @ai.chat(
        parameters: {
          model: model,
          messages: [{
            role: "user", content: prompt
          }]
        }.merge((format == :json) ? {response_format: {type: "json_object"}} : {})
      )

      response.dig("choices", 0, "message", "content")
    end
  end
end
