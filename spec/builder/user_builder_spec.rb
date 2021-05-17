require 'rspec'
require_relative '../../lib/builder/user_builder'

describe Builder::UserBuilder do
  subject(:build_user) do
    described_class.new.call(
      user_id: user_id,
      email: email,
      tags: tags,
      facebook_id: facebook_id,
      facebook_picture: facebook_picture,
      twitter_id: twitter_id,
      twitter_picture: twitter_picture
    )
  end

  let(:user_id) { 42 }
  let(:email) { 'sample@email.com' }
  let(:tags) { ['lorem', 'ipsum'] }
  let(:facebook_id) { 12 }
  let(:facebook_picture) { 'facebook_picture_path' }
  let(:twitter_id) { 21 }
  let(:twitter_picture) { 'twitter_picture_path' }

  context 'when the user parameters are not right' do
    context 'when the id is not an integer' do
      let(:user_id) { 'id_as_a_string' }

      it 'raises an error' do
        expect { build_user }.to raise_error('id must be an integer')
      end
    end

    context 'when the email is not a string' do
      let(:email) { 12 }

      it 'raises an error' do
        expect { build_user }.to raise_error('email must be a string')
      end
    end

    context 'when the tags are not an array' do
      let(:tags) { 12 }

      it 'raises an error' do
        expect { build_user }.to raise_error('tags must be an array')
      end
    end

    context 'when the profiles are not the right object' do
      let(:profile_builder) { instance_double(Builder::ProfilesBuilder) }

      before(:each) do
        allow(Builder::ProfilesBuilder).to receive(:new).and_return(profile_builder)
        allow(profile_builder).to receive(:call).and_return(profiles)
      end
      let(:profiles) { ['sample'] }

      it 'raises an error' do
        expect { build_user }.to raise_error('profiles must be objects')
      end
    end
  end
end