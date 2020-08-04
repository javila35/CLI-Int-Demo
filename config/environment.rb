require 'bundler'
Bundler.require

# Make classes accessible to run.
require_all 'models';

# Async welcome message to let user know it's working.
puts Rainbow("Loading data...").green;

# API request.
# Create client class
# Use RSPEC to test
require_relative '../bin/fetch';