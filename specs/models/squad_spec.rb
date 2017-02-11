require_relative '../spec_helper'
require_relative '../../models/squad'

describe 'Squad' do
  describe 'create a squad object' do
    it 'fails creating a squad without params' do
      assert_raises ArgumentError do
        Squad.new()
      end
    end

    it 'create a new squad' do
      squad = Squad.new(id: 10, name: 'Squad 10', club: 'Irish Rugby')

      assert squad
    end
  end
end
