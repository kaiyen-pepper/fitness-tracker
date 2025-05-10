class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

Article.create(title: "My First Article", content: "This is my first article.")

# Validations help keep your data clean
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
end

# Product model
class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :shop
  has_many :variants
  has_many :orders, through: :order_items

  before_save :set_slug

  private

  def set_slug
    self.slug = title.parameterize
  end
end