[![Discorb Banner](https://discorb-lib.github.io/assets/banner.svg)](https://discorb-lib.github.io/)

This template was created in order to ease file organization.

## Template structure

```
Discorb-Template
├── commands
│   └── ping.rb
├── main.rb
├── env.rb
└── config.json
```

- **main.rb** : The main file.
- **env.rb** : Imports and env variables file.
- **config.json** (*Optionnal*) : Configuration file, can be replaced by **env.rb**.
- **commands** : Folder which contain all commands.
- **ping.rb** : example of command.

## Config
### ENV file

```ruby
module Environment
  CLIENT = Discorb::Client.new
  GUILD_IDS = ["958780070140474523"]
  TOKEN = "uaGuPPnOpZUEGRs49Bl6PBkQVMe0aeZLl0UmmrMOoNRmOcblQ9"
 end
```

### JSON file

```JSON
{
  "token" : "uaGuPPnOpZUEGRs49Bl6PBkQVMe0aeZLl0UmmrMOoNRmOcblQ9",
  "guild_ids" : [
    "958780070140474523"
  ]
}
```

### Main file

```ruby
require_relative "env" # OBLIGATORY

### For env file ###
token = Environment::TOKEN
guild_ids = Environment::GUILD_IDS

### For JSON file ###
require "json" # move this to env file to centralize imports

config_file = File.read("./config.json")
config = JSON.parse(config_file)

token = config["token"]
guild_ids = config["guild_ids"]

...
```

## Installation

**REQUIRE** [Discorb Lib](https://discorb-lib.github.io/)

Create directory for the project and execute this in :

```sh
$ git clone https://github.com/Kodesade/Discorb-Template.git
```

## Usage

### Create command

add file in `commands/`, file must looks like : `hello_world.rb`.

```ruby 
require_relative "../env"

module HelloWorld # Same as filename as PascalCase
  NAME="command_name"
  DESCRIPTION="command_description"
  OPTIONS={}
  DM=true
  PERMISSIONS=nil
  COMMAND = -> (interaction) {
    interaction.post("Hello, World!", ephemeral: true)
  }
end
```
Then, execute this in working dir :

```sh
$ discorb setup
```
