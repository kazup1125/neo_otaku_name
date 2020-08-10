require 'rails_helper'

RSpec.describe 'HomeController', type: :routing do
  describe 'routing' do
    it 'routes to #top' do
      expect(get: "/home/top").to route_to("home#top")
    end
  end
end
