require_relative '../config/environment';

# Declare shortcut variables.
prompt = TTY::Prompt.new;
chunks = Chunks.all

if chunks.length == 0 
    puts Rainbow("Currently no trucks are open.").red;
elsif chunks.length == 1
    puts Rainbow("Trucks currently open: ").underline;
    Chunks.showChunk(0).each do |truck|
        Chunks.convert(truck)
    end
else
    i =  0;
    until i >= chunks.length do
        puts Rainbow("Trucks currently open:").red.underline + " page #{i + 1}/#{chunks.length + 1}"
        Chunks.showChunk(i).each do |truck|
            Chunks.convert(truck)
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