require_relative '../../lib/profile/facebook'
require_relative '../../lib/profile/twitter'

class Profiles
  attr_reader :facebook, :twitter

  def initialize(facebook:, twitter:)
    @facebook = facebook
    @twitter = twitter
  end
end
