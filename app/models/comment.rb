class Comment < ApplicationRecord
  belongs_to :post

  validates :body, format: { with: /\A(?!.*\b(Trump|Kamala)\b).*/, message: "should not be about the election" }, length: { minimum: 1 }
end
