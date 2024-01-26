# frozen_string_literal: true

require_relative "weather_sdk/version"
require 'json'
require 'httparty'

module WeatherSdk
  class Error < StandardError; end

  class Client
    include HTTParty
    API_URL = 'https://api.openweathermap.org/data/2.5/weather'

    def self.get_weather_by_city(city_name, api_key)
      url = "#{API_URL}?q=#{city_name}&appid=#{api_key}"
      response = get(url)

      if response.code == 200
        response_parsed = JSON.parse(response.body)
        response_parsed.dig('main', 'temp')
      else
        raise Error, 'Cannot find city or execute request'
      end
    end
  end
end