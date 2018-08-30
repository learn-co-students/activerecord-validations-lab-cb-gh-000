class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-fiction"]}
    validate :is_click_bait

    def is_click_bait
        if !!title && !(title.match(/Won't\sBelieve|Secret|Top\d|Guess/).class == MatchData)
            errors.add(:title, "must be clickbait")
        end
    end
end
