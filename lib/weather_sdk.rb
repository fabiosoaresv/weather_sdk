Dir.glob(File.join(__dir__, 'weather_sdk', '*.rb')).each do |file|
  require file
end

module WeatherSdk
  class Client
    def initialize(weather_service)
      @weather_service = weather_service
    end

    def get_weather_by_city(city, api_key)
      @weather_service.execute(city, api_key)
    end
  end
end