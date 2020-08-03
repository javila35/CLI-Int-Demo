require 'bundler'
Bundler.require

# Make classes accessible to run.
require_all 'models';

# API request.
require_relative '../bin/fetch';