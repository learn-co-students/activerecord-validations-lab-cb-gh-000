class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title && record.title.match(/Won\'t Believe|Secret|Top [0-9]|Guess/)
      record.errors[:title] << "Clickbait!"
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
