require "httparty"
def view(template); erb template.to_sym; end

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

for day in forecast["daily"]
    puts "#{day["weather"][0]["description"]}"
end



        @newnumber = 1
        @imagelinkuse = @imagelink[@newnumber] 

        @newnumber + 1

        unless @imagelink.nil?
            @imagelinkuse = "/images/backup_S.png"
        end



         @imagelink = []
        for article in news["articles"]
            if "#{article["urlToImage"]}" then
                @imagelink << "/images/backup_S.png"
            else
                @imagelink << "#{article["urlToImage"]}"
            end
        end



    @date = []
        for day in @time
            @date << Time.at(day).to_datetime
        end


    @day = []
        for day in @date
            @day = @date.strftime('%A, %B-%d')
        end
        
    @time = 1589945927

    @date = Time.at(@time-18000).to_datetime

    @day = @date.strftime('%A, %B-%d')

    my_string = "abcdefg"
if my_string.include? "cde"
   puts "String includes 'cde'"
end



        elsif @time_check > @sunset


            if @time_check < @sunrise
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

        else
