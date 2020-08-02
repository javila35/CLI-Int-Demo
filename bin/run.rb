# Move these to an environment file.
require 'tty-prompt'
require 'httparty'
require 'active_support/core_ext/time'
require 'json'

# Declare initial Prompt and question
prompt = TTY::Prompt.new
question = prompt.yes?("Would you like to see more info?")

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

# Fetch all data from API. Cycle through in the following lines.
response = HTTParty.get("https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 <= '#{hour}' AND end24 >= '#{hour}' AND dayofweekstr = '#{day}'")
trucks = JSON[response.body].sort_by{ |truck| truck['applicant'].to_s }

# Current is where I'll store the 10 to display at a time.
# current = trucks.first(10)
# displayTrucks = current.map do |truck|
#     truck.fetch_values("applicant", "location")
# end
# trucks = trucks.shift(10)

while trucks.length > 0 do
    current = trucks.first(10)
    trucks = trucks.shift(10)
    displayTrucks = current.map do |truck|
        truck.fetch_values("applicant", "location")
    end
    question
    if question
        puts displayTrucks
        current = trucks.first(10)
        displayTrucks = current.map do |truck|
            truck.fetch_values("applicant", "location")
        end
        trucks = trucks.shift(10)
    else
        puts "Thanks!"
        trucks = []
    end
end



# question = prompt.ask("What's your name?")

