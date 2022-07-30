require "discorb"
require 'date'
require "json" # Remove if u don't use JSON
require "find"

module Environment 
  CLIENT = Discorb::Client.new
  GUILD_IDS = ["ID_OF_YOUR_GUILD"]
  TOKEN = "YOUR TOKEN"
end

class BadFilename < Exception; end
