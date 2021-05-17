require_relative 'profiles_builder'
require_relative '../models/user'

module Builder
  class UserBuilder
    def call(user_id:, email:, tags:, facebook_id:, facebook_picture:, twitter_id:, twitter_picture:)
      raise('id must be an integer') unless user_id.is_a? Integer
      raise('email must be a string') unless email.is_a? String
      raise('tags must be an array') unless tags.is_a? Array

      profiles = Builder::ProfilesBuilder.new.call(
        facebook_id: facebook_id,
        facebook_picture: facebook_picture,
        twitter_id: twitter_id,
        twitter_picture: twitter_picture
      )

      raise('profiles must be objects') unless profiles.is_a? Profiles

      User.new(id: user_id, email: email, tags: format_tags(tags), profiles: profiles)
    end

    private

    def format_tags(array)
      array.join(',')
    end
  end
end
