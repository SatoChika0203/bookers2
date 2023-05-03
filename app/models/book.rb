class Book < ApplicationRecord
  
  validates :title, presence: true

  validates :body, presence: true, length: { maximum: 200 }
  
  belongs_to :user
  # 関連付けられるのは１つのuserモデルのため、単数形
  
end