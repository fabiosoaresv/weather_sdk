require 'httparty'

module WeatherSdk
  class ApiRequest

    def self.get(url)
      HTTParty.get(url)
    end
  end
end