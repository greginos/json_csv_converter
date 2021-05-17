require_relative '../profile/facebook'
require_relative '../profile/twitter'
require_relative '../models/profiles'

module Builder
  class ProfilesBuilder
    def call(facebook_id:, facebook_picture:, twitter_id:, twitter_picture:)
      raise('id must be an integer') unless facebook_id.is_a?(Integer) && twitter_id.is_a?(Integer)
      raise('picture must be a string') unless facebook_picture.is_a?(String) && twitter_picture.is_a?(String)

      Profiles.new(
        facebook: Profile::Facebook.new(facebook_id, facebook_picture),
        twitter: Profile::Twitter.new(twitter_id, twitter_picture)
      )
    end
  end
end
