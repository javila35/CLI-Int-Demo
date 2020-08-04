require_relative '../config/environment';

prompt = TTY::Prompt.new;
response = Client.new.api_call

case response.code
    when 200
        all_trucks = AllTrucks.new(JSON[response.body]);
    when 400
        puts Rainbow("400 Bad Request. Please check the query syntax.").red;
        exit
    when 500
        puts Rainbow("500 Internal Server Error. The API is likely experiencing issues.").red;
        exit
    else
        puts Rainbow("There was an error with the API.").red;
        exit
end

until !all_trucks.more?
    all_trucks.display
    question = prompt.yes?("Would you like to see more food trucks?");
    if !question
        break
    end;
    all_trucks.next
end

puts Rainbow("Goodbye").red;