require_relative '../spec_helper'
require_relative '../../models/athlete'

describe 'Athlete' do
  describe 'failing on create athlete object' do
    it 'fails creating a athlete without params' do
      assert_raises ArgumentError do
        Athlete.new()
      end
    end

    it "fails creating a athlete with invalid last played Time" do
      assert_raises ArgumentError do
        Athlete.new(
                  avatar_url: 'https://kitmanlabs.com/avatars/athletes/0.jpg',
                  squad_id: 5,
                  country: 'Korea (North)',
                  last_played: "2017-02-02",
                  name: 'Meagan Gill',
                  position: 'prop',
                  is_injured: true,
                  id: 0
                )
      end
    end
  end

  describe 'create a athlete object' do
    before do
      last_played = DateTime.parse('Sun Mar 15 2015 15:58:00 GMT+0000 (UTC)')

      @athlete = Athlete.new(
                  avatar_url: 'https://kitmanlabs.com/avatars/athletes/0.jpg',
                  squad_id: 5,
                  country: 'Korea (North)',
                  last_played: last_played,
                  name: 'Meagan Gill',
                  position: 'prop',
                  is_injured: true,
                  id: 0
                )
    end


    it 'create a new athlete' do
      assert @athlete
    end

    it "check if last_played is in correct format" do
      assert_equal DateTime, @athlete.last_played.class
    end

  end
end
