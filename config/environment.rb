require 'bundler'
Bundler.require
require 'active_support/core_ext/time'
require_all 'models';

# Async welcome message to let user know it's working.
puts Rainbow("Loading data...").green;