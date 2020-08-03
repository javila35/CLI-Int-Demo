# Grab local machine's time. If not in PDT, convert it.
time = Time.now;

timeZone = time.strftime("%Z");

if timeZone != "PDT"
    time = time.in_time_zone('Pacific Time (US & Canada)');
    puts "Converting time to Pacific.";
end;

# Dissect time into smaller chunks for SoQL query to API.
hour = time.strftime("%H:%M");
day = time.strftime("%A");

# response = HTTParty.get("https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 <= '#{hour}' AND end24 >= '#{hour}' AND dayofweekstr = '#{day}'");
# Test time
response = HTTParty.get("https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 <= '10:00' AND end24 >= '#{hour}' AND dayofweekstr = '#{day}'");

# Fetch all data from API. Sort alphabetically, grab the necessary key/values, and add that to AllTrucks.
if response.code == 200 
    JSON[response.body].sort_by{ |truck| truck['applicant'].to_s }.each{|truck| AllTrucks.all << truck.slice('applicant', 'location')}
    AllTrucks.convert
else 
    puts "There was an error with the API. Please try again.";
end;