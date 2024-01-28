Dir.glob(File.join(__dir__, 'weather_sdk', '*.rb')).each do |file|
  require file
end

module WeatherSdk
  class Client
    def initialize(weather_service)
      @weather_service = weather_service
    end

    def get_weather_by_city_id(id, api_key)
      @weather_service.execute(id, api_key)
    end
  end
end