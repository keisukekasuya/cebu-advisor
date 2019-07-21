class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :category
  mount_uploader :image, ImageUploader
  
  with_options presence: true do
    validates :title
    validates :content
    validates :category
    validates :advisor_id
  end
end
