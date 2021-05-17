require 'rspec'
require_relative '../../lib/builder/profiles_builder'

describe Builder::ProfilesBuilder do
  subject(:build_profiles) { described_class.new.call(facebook_id: facebook_id, facebook_picture: facebook_picture, twitter_id: twitter_id, twitter_picture: twitter_picture) }

  let(:facebook_id) { 42 }
  let(:facebook_picture) { 'facebook_picture_path' }
  let(:twitter_id) { 12 }
  let(:twitter_picture) { 'twitter_picture_path' }

  context 'when facebook profile is not right' do
    context 'when the id is not an integer' do
      let(:facebook_id) { 'id_as_a_string' }
  
      it 'raises an error' do
        expect { build_profiles }.to raise_error('id must be an integer')
      end
    end
    context 'when the picture is not a string' do
      let(:facebook_picture) { 13 }

      it 'raises an error' do
        expect { build_profiles }.to raise_error('picture must be a string')
      end
    end
  end

  context 'when twitter profile is not right' do
    context 'when the id is not an integer' do
      let(:twitter_id) { 'id_as_a_string' }

      it 'raises an error' do
        expect { build_profiles }.to raise_error('id must be an integer')
      end
    end
    context 'when the picture is not a string' do
      let(:twitter_picture) { 13 }

      it 'raises an error' do
        expect { build_profiles }.to raise_error('picture must be a string')
      end
    end
  end


  context 'when the picture and the id have the right classes' do
    it 'creates an instance of Profiles' do
      expect(build_profiles).to be_an_instance_of(Profiles)
    end

    it 'creates the right facebook instance' do
      expect(build_profiles.facebook).to be_an_instance_of(Profile::Facebook)
    end

    it 'creates the right twitter instance' do
      expect(build_profiles.twitter).to be_an_instance_of(Profile::Twitter)
    end
  end
end