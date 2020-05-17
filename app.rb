require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

get "/" do
    lat = 41.887562
    long = -88.305092
    units = "imperial" # or metric, whatever you like
    key = "7e94c93c86a480064398484949fe26a4" # replace this with your real OpenWeather API key
    url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"
    #url = "https://api.openweathermap.org/data/2.5/onecall?lat=41.887562&lon=-88.305092&units=imperial&appid=7e94c93c86a480064398484949fe26a4"
    forecast = HTTParty.get(url).parsed_response.to_hash

    @today_temp = "#{forecast["current"]["temp"]}"
    @today_feels = "#{forecast["current"]["feels_like"]}"
    @today_weather = "#{forecast["current"]["weather"][0]["description"]}"

    @daily_temp = []
        for day in forecast["daily"]
            @daily_temp << "#{day["temp"]["max"]}"
        end
    
    @daily_weather =[]
        for day in forecast["daily"]
            @daily_weather << "#{day["weather"][0]["description"]}"
        end

    @daily_min = []
        for day in forecast["daily"]
            @daily_min << "#{day["temp"]["max"]}"
        end

    @weather_number = 0

    url2 = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-04-17&sortBy=publishedAt&apiKey=9f7deae579a84f1f98b61ad1c7213c39"
    news = HTTParty.get(url2).parsed_response.to_hash
    
    @headline =[]
        for article in news["articles"]
            @headline << "#{article["title"]}"
        end

    @tagline = []
        for article in news["articles"]
            @tagline << "#{article["description"]}"
        end

    @newslink = []
        for article in news["articles"]
            @newslink << "#{article["url"]}"
        end
    
    @news_number = 0

    @imagelink = []
        for article in news["articles"]
            @imagelink << "#{article["urlToImage"]}"
        end
    
    view "news"
end