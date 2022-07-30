require_relative 'env' # env.rb use to import gems and set env vars

client = Environment::CLIENT # Discorb::Client Object init in env file
token = Environment::TOKEN
guild_ids = Environment::GUILD_IDS

commands = []

Find.find('commands') do |relative_path| # Iter dir
  
  if relative_path == "commands"
    next
  end

  path_match = relative_path.match(/^commands\/([a-z_]+)\.rb$/)
  
  if not path_match
    raise BadFilename.new("Filename : #{relative_path}") 
  end
  
  command_name = path_match.captures[0]
  
  commands << {name: command_name, path: relative_path}

end

for command in commands
  require_relative command[:path] # Import code of file
  
  command_name = command[:name]
  words = command_name.split("_")
  module_name = ""
  
  for word in words
    module_name << word.capitalize
  end

  client.slash(
    eval("#{module_name}::NAME"), # Name
    eval("#{module_name}::DESCRIPTION"), # Description
    eval("#{module_name}::OPTIONS"), # Options
    guild_ids:guild_ids, # Guild ids, if this opt is nil => Global command 
    dm_permission:eval("#{module_name}::DM"), # Enable for DM
    default_permission:eval("#{module_name}::PERMISSIONS"), # Permission for command
    &(eval("#{module_name}::COMMAND")) # Lambda Object for response of interaction
  )
end

client.once :standby do
  puts "Logged in as #{client.user} on #{Discorb::API_BASE_URL}"
end

client.run(token)

