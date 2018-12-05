class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_type

  private
  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
    if !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'Must be a JPEG, JPG or PNG file')
    end
  end
end
