class ClickbaitValidator < ActiveModel::Validator
  def validate(post)
    unless post.title && post.title.match(/Won\'t Believe|Secret|Top [0-9]+|Guess/)
      post.errors[:title] << "Not enough clickbait!"
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :title, clickbait: true
end
