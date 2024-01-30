# frozen_string_literal: true

module WeatherSdk
  class Config
    attr_reader :api_url, :language, :unit, :range_days

    def initialize(*args)
      assign_values(*args)
    end

    private

    def assign_values(api_url, language, unit, range_days = 0)
      @api_url = api_url
      @language = language
      @unit = unit
      @range_days = range_days
    end
  end
end
