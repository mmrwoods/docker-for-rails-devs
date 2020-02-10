# Don't buffer output to stdout as this doesn't play well with Docker Compose
# (data written to stdout, e.g. via puts, may not be displayed on the terminal)
$stdout.sync = true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
