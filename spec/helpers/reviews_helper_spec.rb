require 'rails_helper'

describe ReviewsHelper, type: :helper do

  context '#star_rating' do

    it 'does ntohing for not a number' do
      expect(helper.star_rating('N/A')).to eq 'N/A'
    end

    it 'should have symbole stars' do
    	expect(helper.star_rating('5')).to eq '★★★★★'
    end

    it 'returns three balck stars and two white stars for three' do
      expect(helper.star_rating('3')).to eq '★★★☆☆'
    end

  end
  
end