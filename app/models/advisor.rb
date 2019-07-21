class Advisor < ApplicationRecord
  mount_uploader :image_name, ImageUploader
  
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  has_secure_password
    validates :password, length: { in: 8..32 }, format: { with: /\A[a-zA-Z0-9]+\z/i }
    validates :password_confirmation, length: { in: 8..32 }
    
end
