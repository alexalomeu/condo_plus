ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'logger'
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.  