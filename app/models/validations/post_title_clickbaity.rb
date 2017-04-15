class PostTitleClickbaity < ActiveModel::Validator
  def validate record
    title_clickbaitness =
      if record.title
        record.title.
          match(/(Won't Believe|Top \d*|Secret|Guess)/)
      else
        false
      end
    unless title_clickbaitness
      record.errors[:title] << "Title must be 'clickbaity'"
    end
  end
end
