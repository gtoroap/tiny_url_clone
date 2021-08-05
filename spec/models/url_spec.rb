require 'rails_helper'

describe Url, type: :model do
  subject(:url) { Url.new(original: 'http://url.com') }
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a original url' do
      subject.original = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a bad formatted url' do
      subject.original = 'http::/asdasd'
      expect(subject).to_not be_valid
    end
  end

  describe '#generate_short_url' do
    it 'returns a new shortened url' do
      subject.generate_short_url
      expect(subject.slug).to_not be_empty
    end
  end

  describe '#shortened_url' do
    it 'returns a shortened url with default domain' do
      expect(subject.shortened_url).to start_with('http://localhost:3000/')
    end
  end

  describe '#update_stats' do
    it 'increments visitors_count of url' do
      subject.update_stats('0.0.0.0')
      expect(subject.visitors_count).to eq(1)
    end
  end
end
