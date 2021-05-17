require 'csv'

class CSVGenerator
  def call(users:)
    CSV.open('exports/convert.csv', 'w') do |csv|
      csv << %w[id email tags profiles.facebook.id profiles.facebook.picture profiles.twitter.id
                profiles.twitter.picture]
      users.each do |user|
        csv << [user.id.to_s, user.email, user.tags, user.profiles.facebook.id.to_s, user.profiles.facebook.picture,
                user.profiles.twitter.id.to_s, user.profiles.twitter.picture]
      end
    end
  end
end
