class Category < ApplicationRecord
  has_many :posts

  scope :main_categories, -> { where(parent_id: nil) }
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_id'

  before_save :set_slug
  before_create :set_slug
  before_update :set_slug

  has_one_attached :image

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize.truncate(80, omission: '').downcase
  end

end
