require 'tty-prompt'
require 'httparty'


response = HTTParty.get('https://data.sfgov.org/resource/jjew-r69b.json')
puts response.message
# prompt = TTY::Prompt.new
# question = prompt.ask("What's your name?")

