# Move these to an environment file.
require 'tty-prompt'
require 'httparty'
require 'active_support/core_ext/time'
require 'pry'
require 'json'

# Grab local machine's time and convert to Pacific time zone.
time = Time.now;
timeZone = time.strftime("%Z");
if timeZone != "PDT"
    time = time.in_time_zone('Pacific Time (US & Canada)')
    puts "Converting time to Pacific."
end

# Dissect time into smaller chunks for SoQL query to API.
hour = time.strftime("%H:%M");
day = time.strftime("%A");


response = HTTParty.get("https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 <= '#{hour}' AND end24 >= '#{hour}' AND dayofweekstr = '#{day}'")
# Trucks is an array of the entire response.
# Current is where I'll store the 10 to display at a time.
trucks = JSON[response.body].sort_by{ |truck| truck['applicant'].to_s }
current = trucks.first(10)
displayTrucks = current.map do |truck|
    truck.fetch_values("applicant", "location")
end
puts displayTrucks


# puts response.message
# prompt = TTY::Prompt.new
# question = prompt.ask("What's your name?")

