require 'csv'
require 'json'
require_relative 'user'
require_relative 'profile/facebook'
require_relative 'profile/twitter'

class JsonToCsv
    def initialize(json_file)
        @file = json_file.to_json
    end

    def convert
        users = convert_json_to_users
        CSV.open('convert.csv', 'w') do |csv|
        csv << ['id', 'email', 'tags', 'profiles.facebook.id', 'profiles.facebook.picture', 'profiles.twitter.id', 'profiles.twitter.picture']
        users.each do |user|
            csv << [user.id,user.email, user.tags, user.profiles.facebook.id, user.profiles.facebook.picture, user.profiles.twitter.id, user.profiles.twitter.picture]
        end
        end
    end

    private

    def convert_json_to_users
        users = []
        JSON.parse(@file).each do |line|
            profiles = Profiles.new(
                Profile::Facebook.new(line['profiles']['facebook']['id'], line['profiles']['facebook']['picture']),
                Profile::Twitter.new(line['profiles']['twitter']['id'], line['profiles']['twitter']['picture'])
            )
            user = User.new(id:line['id'], email:line['email'], tags: format_tags(line['tags']), profiles: profiles)
            users << user
        end
        users
    end

    def format_tags(array)
        array.join(',')
    end
end
