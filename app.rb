require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

get "/" do
    lat = 42.0574063
    long = -87.6722787
    units = "imperial" # or metric, whatever you like
    key = "7e94c93c86a480064398484949fe26a4" # replace this with your real OpenWeather API key
    url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"
    #url = "https://api.openweathermap.org/data/2.5/onecall?lat=42.0574063&lon=-87.6722787&units=imperial&appid=7e94c93c86a480064398484949fe26a4"
    forecast = HTTParty.get(url).parsed_response.to_hash

    puts "It is currently #{forecast["current"]["temp"]} degrees and #{forecast["current"]["weather"][0]["description"]}"
    puts "Extended forecast:"
day_number = 1
for day in forecast["daily"]
   puts "On day #{day_number}, A high of #{day["temp"]["max"]} and #{day["weather"][0]["description"]}"
   day_number = day_number + 1
end
end
