
class PostTitleValidator < ActiveModel::Validator
  def validate(record)
    clickbatArr = ["Won't Believe", "Secret", "Top", "Guess"]
    if record.title.present?
      unless clickbatArr.any? { |w| record.title =~ /#{w}/ }
        record.errors[:title] << "Invalid title"
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with PostTitleValidator
end
