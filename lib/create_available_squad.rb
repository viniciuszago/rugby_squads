require_relative '../models/athlete'
require_relative '../models/squad'

# Squads are created justed if has the properly athletes positions, which are:
# 2 props, 1 hooker, 2 locks, 2 flankers, 1 Number Eight, 1 Scrum Half,
# 1 Out Half, 2 Centres, 2 Wingers, 1 Full Back
# The athletes MUST NOT BE INJURED!
# If a athlete is missing, it will raise an exception
class CreateAvailableSquad
  attr_reader :squad_obj, :data_hash, :athletes, :squad_athletes

  def initialize(squad_obj, data_hash)
    raise ArgumentError.new("Invalid args") if squad_obj.empty? && data_hash.empty?

    @squad_obj = squad_obj
    @data_hash = data_hash
  end

  def call
    create_squad
  end

  private

  def create_squad
    squad = ::Squad.new(squad_obj.merge!(id: next_squad_id))
    squad.athletes = create_squad_athletes

    squad
  end

  def next_squad_id
    data_hash["squads"].max { |s| s["id"] }
                       .fetch("id") + 1
  end

  def create_squad_athletes
    find_athletes
    get_athletes_on_squad
  end

  def find_athletes
     @athletes = data_hash["athletes"].select { |a| !a["is_injured"] }.map do |a|
        ::Athlete.new(
                      avatar_url: a['avatar_url'],
                      squad_id: a['squad_id'],
                      country: a['country'],
                      last_played: DateTime.parse(a['last_played']),
                      name: a['name'],
                      position: a['position'],
                      is_injured: a['is_injured'],
                      id: a['id']
                    )
    end
  end

  # 2 props, 1 hooker, 2 locks, 2 flankers, 1 Number Eight, 1 Scrum Half,
  # 1 Out Half, 2 Centres, 2 Wingers, 1 Full Back
  def get_athletes_on_squad
    @squad_athletes = [find_athletes_for('prop', 2),
                       find_athletes_for('hooker', 1),
                       find_athletes_for('lock', 2),
                       find_athletes_for('flanker', 2),
                       find_athletes_for('number-eight', 1),
                       find_athletes_for('scrum-half', 1),
                       find_athletes_for('out-half', 1),
                       find_athletes_for('centre', 2),
                       find_athletes_for('winger', 2),
                       find_athletes_for('full-back',1)].flatten
  end

  def find_athletes_for(position, amount)
    athletes.select { |a| a.position == position }
            .take(amount)
  end
end
