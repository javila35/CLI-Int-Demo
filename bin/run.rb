require_relative '../config/environment'
prompt = TTY::Prompt.new
response = Client.new.api_call

case response.code
    when 200
        all_trucks = AllTrucks.new(JSON[response.body])
    when 400
        puts "400 Bad Request. Please check the query syntax."
        exit
    when 500
        puts "500 Internal Server Error. The API is likely experiencing issues."
        exit
    else
        puts "There was an error with the API."
        exit
end

while ( trucks = all_trucks.next )
    puts "Trucks currently open: page #{all_trucks.current}/#{all_trucks.length}"
    trucks.each do |truck|
        puts "#{truck['applicant']} located at #{truck['location']}."
    end
    if( all_trucks.more? )
        question = prompt.yes?("Would you like to see more food trucks?")
        if !question
            break
        end
    end
end

puts "Goodbye"