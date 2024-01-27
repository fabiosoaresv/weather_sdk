# frozen_string_literal: true

require_relative "weather_sdk/version"
require 'json'
require 'httparty'

module WeatherSdk
  class Error < StandardError
    def initialize
      super('Cannot find city or execute request')
    end
  end

  class Client
    include HTTParty
    API_URL = 'https://api.openweathermap.org/data/2.5/forecast/'
    LANG = 'pt_br'
    RANGE_DAYS = 40
    UNIT = 'metric'

    def self.get_weather_by_city(city, api_key)
      url = "#{API_URL}?q=#{city}&cnt=#{RANGE_DAYS}&lang=#{LANG}&units=#{UNIT}&appid=#{api_key}"
      response = get(url)

      raise Error.new unless response.code == 200
      parse_response(response.body)
    end

    private

    def self.parse_response(response)
      response_parsed = JSON.parse(response)
      formatted_data = {}

      response_parsed.dig('list').each do |data|
        date = parse_date(data['dt'].to_s)

        formatted_data[date] ||= {
          date: date,
          temperature: data.dig('main', 'temp'),
          weather: data.dig('weather', 0, 'description')
        }
      end

      formatted_data.values
    end

    def self.parse_date(date)
      DateTime.strptime(date, '%s').strftime('%d/%m')
    end
  end
end