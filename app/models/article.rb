class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :desc, presence: true, length: { minimum: 5, maximum: 500 }
end
