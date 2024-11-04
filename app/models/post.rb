class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :content, format: { with: /\A(?!.*\b(Trump|Kamala)\b).*/, message: "should not be about the election" }, length: { minimum: 1 }
end
