require 'rspec'
require_relative '../../lib/converter/csv_generator'
require_relative '../../lib/models/user'

describe CSVGenerator do
  subject(:generate) { described_class.new.call(users: users) }

  let(:expected_csv) { 'fixtures/response.csv' }

  context 'when there are no users' do
    let(:users) { [] }

    it 'returns the titles' do
      generate
      expect(CSV.parse_line(File.read('exports/convert.csv'))).to eq(CSV.parse_line(File.read(expected_csv)))
    end
  end

  context 'when there are users' do
    let(:users) { [user] }
    let(:user) do
      instance_double(User,
                      id: 42,
                      email: 'sample@email.com',
                      tags: 'lorem, ipsum',
                      profiles: profiles)
    end
    let(:twitter) { instance_double(Profile::Twitter, id: 12, picture: 'twitter_picture_path') }
    let(:facebook) { instance_double(Profile::Facebook, id: 21, picture: 'facebook_picture_path') }
    let(:profiles) { instance_double(Profiles, facebook: facebook, twitter: twitter) }

    it 'exports the user characteristics' do
      generate
      expect(CSV.parse(File.read('exports/convert.csv')).last).to eq([user.id.to_s, user.email, user.tags,
                                                                      user.profiles.facebook.id.to_s,
                                                                      user.profiles.facebook.picture,
                                                                      user.profiles.twitter.id.to_s,
                                                                      user.profiles.twitter.picture])
    end
  end
end
