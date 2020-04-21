require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe 'Are validation effective?' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).
      is_at_most(140)
    }
    it { should validate_presence_of(:place) }
    it { should validate_presence_of(:rate) }
  end
end