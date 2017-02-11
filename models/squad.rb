# Squad object
# Every squad must have id, name and club
class Squad
  attr_accessor :id, :name, :club, :athletes

  def initialize(args = {})
    @id       = args[:id]
    @name     = args[:name]
    @club     = args[:club]

    check_params
  end

  private

  def check_params
    raise ArgumentError.new("A required param is missing.") unless required_params
  end

  def required_params
    id || name || club
  end
end
