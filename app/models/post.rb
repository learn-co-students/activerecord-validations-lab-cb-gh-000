class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_click_bait_y

  def title_is_click_bait_y
    baits = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
    # baits.any? do |bait|
    #   title.include?(bait)
    # end
    test = baits.any? {|bait| title.include?(bait) if title}
    unless test
      errors.add(:bait_status, 'Doesn\'t include bait')
    end
      # You Won't Believe this post
      #This post is top Secret
      #A post you should Guess
      #A outstanding post
  end
end
