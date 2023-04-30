class Book < ApplicationRecord
  has_one_attached :profile_image
  
  validates :title, presence: true
  validates :body, presence: true
  
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  belongs_to :user
  # 関連付けられるのは１つのuserモデルのため、単数形
  
end