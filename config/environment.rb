require 'bundler/setup'
Bundler.require
require "tty-prompt"
prompt = TTY::Prompt.new

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/development.sqlite3"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'
