class Restaurant < ApplicationRecord
    has_many :ratings
    validates_uniqueness_of :name, :case_sensitive => false
    validates :name, length:{minimum: 3}

    def average_rating
        sum = 0
        if ratings.count == 0
            return 0
        else    
        ratings.each do |rating|
            sum += rating.stars
        end
        average = sum/ ratings.count   
        end 
    end     

end
