require 'spec_helper'

describe TwitterClient do

  describe '#search_term' do
    before do
      VCR.use_cassette 'search_term' do
        user = FactoryGirl.create :user
        client = TwitterClient.new('faketoken', 'fakesecret')
        @results = client.search_term "wat", user.id
      end
    end

    it 'returns hash with searchTime value' do
      @results[:searchTime].should eq 'Sun, 26 May 2013 07:05:22 +0000'
    end

    it 'returns hash with 20 tweets' do
      @results[:tweets].count.should eq 20
    end
  end

  describe '#search_user' do
    before do
      VCR.use_cassette 'search_user' do
        client = TwitterClient.new('faketoken', 'fakesecret')
        @results = client.search_user 'messick'
      end
    end

    it 'returns hash with searchTime value' do
      @results[:searchTime].should eq 'Sun, 26 May 2013 07:08:18 +0000'
    end

    it 'returns hash with 20 tweets' do
      @results[:tweets].count.should eq 20
    end
  end
end
