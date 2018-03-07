require_relative 'validations/post_title_clickbaity'
class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length:{ minimum: 250}
  validates :summary, length:{ maximum: 250}
  validates :category, inclusion: %w{Fiction Non-Fiction}
  validates_with PostTitleClickbaity
end
