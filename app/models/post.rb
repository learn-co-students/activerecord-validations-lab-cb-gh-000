class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :has_clickbaity_title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  def has_clickbaity_title
    has_clickbaity_title = false

    clickbaity_phrases = ["Won't Believe", "Secret", "Top ", "Guess"]
    clickbaity_phrases.each do |phrase|
      if title.present? && title.include?(phrase)
        has_clickbaity_title = true
      end
    end

    errors.add(:title, "must be clickbaity") unless has_clickbaity_title
    has_clickbaity_title
  end
end
