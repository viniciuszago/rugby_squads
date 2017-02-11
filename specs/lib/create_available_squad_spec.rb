require_relative '../spec_helper'
require_relative '../../lib/create_available_squad'

require 'json' # Require json because it is not in ruby core lib, just in std

describe 'Create Available Squad' do

  it 'fails to create squad without data' do
    assert_raises ArgumentError do
      CreateAvailableSquad.new([], {}).call
    end
  end

  describe 'Create a new squad' do
    before do
      file = File.read('rugby_athletes.json')

      @data_hash = JSON.parse(file)
      @squad_obj = {
        name: "Squad Irish",
        club: 'Irish Rugby'
      }
    end

    it 'does not consider injured athletes' do
      squad = CreateAvailableSquad.new(@squad_obj, @data_hash).call
      assert squad.athletes.all? {|a| !a.injured? }
    end

    it 'creates a new squad available players' do
      squad = CreateAvailableSquad.new(@squad_obj, @data_hash).call

      # Asserts for created squad
      assert squad
      assert_equal "Squad Irish", squad.name
      assert_equal "Irish Rugby", squad.club

      # Asserts for created squad athletes
      positions = squad.athletes.each_with_object(Hash.new(0)) { |v, obj|  obj[v.position] += 1 }

      expected_positions = {
        "prop"         => 2,
        "hooker"       => 1,
        "flanker"      => 2,
        "number-eight" => 1,
        "scrum-half"   => 1,
        "out-half"     => 1,
        "centre"       => 2,
        "winger"       => 2,
        "full-back"    => 1,
        "lock"         => 2
      }

      assert_equal expected_positions, positions
    end
  end
end
