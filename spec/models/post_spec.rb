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
  
  describe 'Are validation effective?' do
    before do
      @post1 = Post.create(name:'test', place:'中央区', content: 'test', rate: 1.5)
      @post2 = Post.create(name:'test', place:'目黒区', content: 'test', rate: 1.5)
    end
    
      #検索文字列に一致するPostを返すこと
      it 'return posts that match search term' do
        expect(Post.search('中央区')).to include(@post1)
      end
      
      #検索文字列に一致しないPostは返さないこと
      it 'not return posts that mismatch search term' do
        expect(Post.search('中央区')).to_not include(@post2)
      end
  end
end