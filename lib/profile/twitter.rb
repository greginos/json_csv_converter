module Profile
  class Twitter
    attr_reader :id, :picture

    def initialize(id, picture)
      @id = id
      @picture = picture
    end
  end
end
