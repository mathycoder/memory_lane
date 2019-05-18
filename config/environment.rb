require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/memorylane.sqlite"
)

require_all 'app'
require 'active_support/core_ext/integer/inflections'
