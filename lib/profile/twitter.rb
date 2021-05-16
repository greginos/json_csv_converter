module Profile
    class Twitter
        attr_reader :id, :picture
    
        def initialize(id, picture)
            raise('id must be an integer') unless id.is_a? Integer
            raise('picture must be a string') unless picture.is_a? String
            
            @id = id
            @picture = picture
        end
    end
end
