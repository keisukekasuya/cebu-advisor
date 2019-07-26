class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :category
  
  with_options presence: true do
    validates :title
    validates :content
    validates :category
    validates :advisor_id, presence :true
  end
  
  def advisor
    return Advisor.find_by(id: self.advisor_id)
  end
end
