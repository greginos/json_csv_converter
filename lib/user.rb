require_relative 'profiles'

class User
    attr_reader :id, :email, :tags, :profiles

    def initialize(id:, email:, tags:, profiles:)
        raise('id must be an integer') unless id.is_a? Integer
        raise('email must be a string') unless email.is_a? String
        raise('tags must be an string') unless tags.is_a? String
        raise('profiles must be objects') unless profiles.is_a? Profiles

        @id = id
        @email = email
        @tags = tags
        @profiles = profiles
    end
end