require_relative 'lib/create_available_squad'

require 'json' # Require json because it is not in ruby core lib, just in std

def new_squad
  file = File.read('rugby_athletes.json')

  @data_hash = JSON.parse(file)

  squad_obj = {
    name: "Squad Irish",
    club: 'Irish Rugby'
  }

  squad = CreateAvailableSquad.new(squad_obj, @data_hash).call
  puts <<EOF
Squad Name: #{squad.name}
Squad Club: #{squad.club}
Squad ID: #{squad.id}

#{squad.athletes.join("\n")}
EOF
end

new_squad