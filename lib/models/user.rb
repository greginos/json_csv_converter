require_relative 'profiles'

class User
  attr_reader :id, :email, :tags, :profiles

  def initialize(id:, email:, tags:, profiles:)
    @id = id
    @email = email
    @tags = tags
    @profiles = profiles
  end
end
