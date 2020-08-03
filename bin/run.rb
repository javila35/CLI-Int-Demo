require_relative '../config/environment';

# Async welcome message to let user know it's working.
puts Rainbow("Loading data...").green;

# Declare shortcut variables.
prompt = TTY::Prompt.new;
chunks = Chunks.all

# Give the user the option to break out of the loop after displaying each chunk.
if chunks.length == 0 
    puts Rainbow("Currently no trucks are open.").red;
elsif chunks.length == 1
    puts Rainbow("Trucks currently open: ").underline;
    Chunks.showChunk(0).each do |truck|
        puts Rainbow("#{truck['applicant']}").blue + " located at " + Rainbow("#{truck['location']}").green;
    end
else
    i =  0;
    until i >= chunks.length do
        puts Rainbow("Trucks currently open:").red.underline + " page #{i + 1}/#{chunks.length + 1}"
        Chunks.showChunk(i).each do |truck|
            puts Rainbow("#{truck['applicant']}").blue + " located at " + Rainbow("#{truck['location']}. #{truck['locationdesc']}").green;
        end;
        question = prompt.yes?("Would you like to see more food trucks?");
        if question
            i+=1;
        else
            i = chunks.length;
        end;
    end;
end;

puts Rainbow("Goodbye").red;