require 'json'
require_relative '../builder/user_builder'

class JSONImporter
  def call(file:)
    users = []
    JSON.parse(file).each do |line|
      begin
        user = Builder::UserBuilder.new.call(
          user_id: line['id'].to_i,
          email: line['email'],
          tags: line['tags'],
          facebook_id: line['profiles']['facebook']['id'].to_i,
          facebook_picture: line['profiles']['facebook']['picture'],
          twitter_id: line['profiles']['twitter']['id'].to_i,
          twitter_picture: line['profiles']['twitter']['picture']
        )
        users << user
      rescue StandardError
        next
      end
    end
    users
  end
end
