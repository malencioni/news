require "httparty"
require "date"
def view(template); erb template.to_sym; end

    lat = 42.0574063
    long = -87.6722787
    units = "imperial" # or metric, whatever you like
    key = "7e94c93c86a480064398484949fe26a4" # replace this with your real OpenWeather API key
    url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"
    #url = "https://api.openweathermap.org/data/2.5/onecall?lat=42.0574063&lon=-87.6722787&units=imperial&appid=7e94c93c86a480064398484949fe26a4"
    forecast = HTTParty.get(url).parsed_response.to_hash

@time = []
        for day in forecast["daily"]
            @time << "#{day["dt"]}"
        end

@time.map{ |n| puts n}
