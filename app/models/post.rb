class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: {in: ['Fiction','Non-Fiction']}
    validate :click_bait

  def click_bait
    result = false
    ["Won't Believe","Secret","Top","Guess"].each do |x|
      if title.nil? || title.include?(x)
        result = true
      end
    end
    if !result
       errors.add(:title, "not clickbait-y")
    end
  end
end
