require 'date' # STD ruby lib will be used to check and parse date

# Athlete object
# Every athlete must have squad_id, name, position, is_injured, id
# When last_played param is set it must be a DateTime
class Athlete
  attr_accessor :id, :squad_id, :name, :position, :is_injured,
                :avatar_url, :country, :last_played

  def initialize(args = {})
    @id          = args[:id]
    @squad_id    = args[:squad_id]
    @name        = args[:name]
    @position    = args[:position]
    @is_injured  = args[:is_injured] || false # Default value for injured athlete
    @avatar_url  = args[:avatar_url]
    @country     = args[:country]
    @last_played = args[:last_played]

    check_params
  end

  def injured?
    is_injured
  end

  def to_s
    "#{position} - #{name}"
  end

  private

  def check_params
    raise ArgumentError.new("A required param is missing.") unless required_params

    check_last_played if last_played
  end

  def required_params
    id || squad_id || name || position
  end

  def check_last_played
    raise ArgumentError.new("Last played is not in correct format. Use DateTime to create it.") unless last_played.is_a? DateTime
  end
end
