require "sinatra"
require "sinatra/reloader"
require "httparty"
require "date"
require "time"
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
            @daily_min << "#{day["temp"]["min"]}"
        end

    @weather_number = 0
    
    @time = []
        for day in forecast["daily"]
            @time << "#{day["dt"]}"
        end
    
    @timenew = @time.map { |n| n}
    @timenewer = @timenew.each.map(&:to_i)
    @date = @timenewer.map
    @day = @date.each {|x| Time.at(x-18000).to_datetime.strftime("%A, %B-%d")}
    @dow = @date.each {|x| Time.at(x-18000).to_datetime.strftime("%A")}
    
    @time_check = Time.new.to_i
    #@time_check = 1590109963
    @sunrise = "#{forecast["current"]["sunrise"]}"
    @sunrise_i = @sunrise.to_i
    @sunset = "#{forecast["current"]["sunset"]}"
    @sunset_i = @sunset.to_i

    @daily_weather_image = []
        if @time_check < @sunrise_i then
            for day in forecast["daily"]
                if day["weather"][0]["main"].include? "Clouds" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/02n@2x.png"
                elsif day["weather"][0]["main"].include? "Thunderstorm" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/11n@2x.png"
                elsif day["weather"][0]["main"].include? "Drizzle" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/10n@2x.png"
                elsif day["weather"][0]["main"].include? "Rain" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/10n@2x.png"
                elsif day["weather"][0]["main"].include? "Snow" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/13n@2x.png"
                elsif day["weather"][0]["main"].include? "Clear" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/01n@2x.png"
                else
                    @daily_weather_image << "http://openweathermap.org/img/wn/50n@2x.png"
                end
            end
        elsif @time_check > @sunset_i
            for day in forecast["daily"]
                if day["weather"][0]["main"].include? "Clouds" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/02n@2x.png"
                elsif day["weather"][0]["main"].include? "Thunderstorm" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/11n@2x.png"
                elsif day["weather"][0]["main"].include? "Drizzle" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/10n@2x.png"
                elsif day["weather"][0]["main"].include? "Rain" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/10n@2x.png"
                elsif day["weather"][0]["main"].include? "Snow" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/13n@2x.png"
                elsif day["weather"][0]["main"].include? "Clear" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/01n@2x.png"
                else
                    @daily_weather_image << "http://openweathermap.org/img/wn/50n@2x.png"
                end
            end

        else
            for day in forecast["daily"]
                if day["weather"][0]["main"].include? "Clouds" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/02d@2x.png"
                elsif day["weather"][0]["main"].include? "Thunderstorm" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/11d@2x.png"
                elsif day["weather"][0]["main"].include? "Drizzle" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/10d@2x.png"
                elsif day["weather"][0]["main"].include? "Rain" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/10d@2x.png"
                elsif day["weather"][0]["main"].include? "Snow" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/13d@2x.png"
                elsif day["weather"][0]["main"].include? "Clear" then
                    @daily_weather_image << "http://openweathermap.org/img/wn/01d@2x.png"
                else
                    @daily_weather_image << "http://openweathermap.org/img/wn/50d@2x.png"
                end
            end
    end
  
        


    url2 = "http://newsapi.org/v2/top-headlines?country=us&category=business&sortBy=publishedAt&apiKey=9f7deae579a84f1f98b61ad1c7213c39"
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
                if article["urlToImage"].nil? then 
                    @imagelink << "/images/backup_S.png"
                else
                    @imagelink << "#{article["urlToImage"]}"
                end
        end




    

    view "news"
end
