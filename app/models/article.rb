class Article < ApplicationRecord
  has_rich_text :content
  
  acts_as_taggable
  acts_as_taggable_on :hotel, :beach, :restaurant, :massage, :enjoyspots, :casino, :nightspots, :moneychange, :others
  
end
