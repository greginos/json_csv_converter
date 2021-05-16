class Profiles
  attr_reader :facebook, :twitter
  
  def initialize(facebook, twitter)
    raise('facebook must be the right object') unless facebook.is_a? Profile::Facebook
    raise('twitter must be the right object') unless twitter.is_a? Profile::Twitter
    
    @facebook = facebook
    @twitter = twitter
  end
end