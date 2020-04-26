require 'rails_helper'

RSpec.describe Like, type: :model do
  
  describe 'Are validation effective?' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
  end
end