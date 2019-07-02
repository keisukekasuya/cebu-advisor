class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :category
  validates :category, presence: true
end
