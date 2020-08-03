# Move these to an environment file.
require 'tty-prompt';
require 'httparty';
require 'active_support/core_ext/time';
require 'json';
require 'rainbow';

puts Rainbow("Loading data...").red;

# Declare initial Prompt, and empty variables.
prompt = TTY::Prompt.new;
truckDetails = [];
displayTruckArray = [];

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
response = HTTParty.get("https://data.sfgov.org/resource/jjew-r69b.json?$where=start24 <= '#{hour}' AND end24 >= '#{hour}' AND dayofweekstr = '#{day}'");

# Fetch all data from API. Grab the necessary information, and add that to displayTrucks.
if response.code == 200 
    JSON[response.body].sort_by{ |truck| truck['applicant'].to_s }.each{|truck| truckDetails << truck.slice('applicant', 'location', 'locationdesc')};
else 
    puts "There was an error with the API. Please try again.";
    puts "Goodbye.";
end;

# Store the large dataset in an array of arrays. 
# The inner arrays contain 10 truck hashes.
until truckDetails.length == 0 do 
    displayTruckArray << truckDetails.first(10);
    truckDetails.shift(10);
end;

# Loop through the innerArrays one at a time.
# Give the user the option to break out of the loop after displaying each chunk.
i =  0;
until i >= displayTruckArray.length do
    puts Rainbow("Currently open trucks:").red.underline + " page #{i + 1}/#{displayTruckArray.length + 1}"
    displayTruckArray[i].each do |truck|
        puts Rainbow("#{truck['applicant']}").blue + " located at " + Rainbow("#{truck['location']}. #{truck['locationdesc']}").green;
    end;
    question = prompt.yes?("Would you like to see more food trucks?");
    if question
        i+=1;
    else
        i = displayTruckArray.length;
        puts Rainbow("Goodbye!").red;
    end;
end;