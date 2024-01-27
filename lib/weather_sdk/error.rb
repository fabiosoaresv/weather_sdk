require "weather_sdk"

module WeatherSdk
  class Error < StandardError
    def initialize
      super('Cannot find city or execute request')
    end
  end
end