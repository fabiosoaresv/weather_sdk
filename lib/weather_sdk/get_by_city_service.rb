require 'json'

module WeatherSdk
  class GetByCityService
    def self.execute(city_id, api_key)
      url = "#{WeatherSdk::Config::API_URL}?id=#{city_id}&cnt=#{WeatherSdk::Config::RANGE_DAYS}&lang=#{WeatherSdk::Config::LANG}&units=#{WeatherSdk::Config::UNIT}&appid=#{api_key}"
      response = WeatherSdk::ApiRequest.get(url)

      raise WeatherSdk::Error.new unless response.code == 200
      parse_response(response.body)
    end

    private

    def self.parse_response(response)
      response_parsed = JSON.parse(response)

      {
        temperatures: fommated_data(response_parsed).values,
        city_name: response_parsed.dig('city', 'name')
      }
    end

    def self.fommated_data(response_parsed)
      response_parsed.dig('list').each_with_object({}) do |data, hash|
        date = parse_date(data['dt'].to_s)

        hash[date] ||= {
          date: date,
          temperature: data.dig('main', 'temp'),
          weather: data.dig('weather', 0, 'description'),
        }
      end
    end

    def self.parse_date(date)
      DateTime.strptime(date, '%s').strftime('%d/%m')
    end
  end
end