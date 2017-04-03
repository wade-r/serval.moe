class Comment < ApplicationRecord
  validates :content, length: { in: 4..400 }

  before_validation do
    self.content =  Rails::Html::FullSanitizer.new.sanitize self.content
    true
  end
end
