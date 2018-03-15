class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 15 }
  validates :summary, length: {maximum: 10}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
   validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
]

  def is_clickbait?
      if CLICKBAIT_PATTERNS.none? {|i| i.match(title)}
        errors.add(:title, "must be clickbait")
      end
  end


end
