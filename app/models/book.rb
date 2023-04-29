class Book < ApplicationRecord
  belongs_to :user
  # 関連付けられるのは１つのuserモデルのため、単数形
end