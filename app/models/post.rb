class Post < ApplicationRecord
  acts_as_taggable

  # sets number or posts per page/load
  self.per_page = 9

  belongs_to :author
  has_one_attached :main_image
  scope :with_preloaded_main_image, -> { preload(main_image_attachment: :blob) }

  has_many_attached :images
  scope :with_preloaded_images, -> { preload(images_attachments: :blob) }

  belongs_to :category

  before_save :set_slug
  before_create :set_slug
  before_update :set_slug

  before_save :format_title

  validates :title, uniqueness: true, presence: true, length: { maximum: 60 }
  validates :body, presence: true

  validates :tag_list, presence: true
  validates :summary, presence: true

  def to_param
    slug
  end

  private

  def set_slug

    time_now = Time.now

    year = time_now.strftime("%Y")
    month = time_now.strftime("%m")
    day = time_now.strftime("%d")

    title_slug = self.title.delete("'").parameterize.truncate(80, omission: '').downcase

    self.slug = year + '-' + month + '-' + day + '-' + title_slug
  end

  def format_title
    self.title = title.titleize
  end




end
