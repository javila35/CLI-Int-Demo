# Food Truck CLI

### Note about API request.
This CLI operates under the assumption that the API uses Pacific time zone. I did not find any information about this in the documentation. This assumption is based off of the results of my test cases. 

## Using this CLI
1. Make sure you have Ruby installed. Find more information [here](https://www.ruby-lang.org/en/documentation/installation/).
2. Navigate to CLI-Int-Demo directory.
3. From your terminal:
    - Run `bundle` to install gem dependencies
    - Run `rake start` to begin CLI
    - Follow prompts

## Dependencies
- [Rake](https://github.com/ruby/rake) -> Start script
- [TTY-Prompt](https://github.com/piotrmurach/tty-prompt) -> Handle user input for displaying more truck information.
- [HTTParty](https://github.com/jnunemaker/httparty) -> Library to handle API call.
- [ActiveSupport](https://github.com/rails/rails/tree/master/activesupport) -> Handle time zone conversion
- [RequireAll](https://github.com/jarmo/require_all) -> One liner to require all models in environment file.