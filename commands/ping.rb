require_relative '../env'

module Ping
  NAME="ping"
  DESCRIPTION="Affiche la latence."
  OPTIONS={}
  DM=true
  PERMISSIONS=nil
  COMMAND = -> (interaction) {
    start = Time.now
    interaction.defer_source(ephemeral:true).wait
    _end = Time.now
    latency = _end - start

    interaction.post("La latence est de : #{latency} secondes")
  }
end
