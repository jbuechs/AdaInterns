class Intern < ActiveRecord::Base
  belongs_to :company
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cohort, presence: true

  IMAGES = ["ada1.jpg", "ada2.png", "barbie.jpg", "grace1.jpg", "grace2.jpg" ]

  def full_name
    return first_name + " " + last_name
  end

  def has_image?
    return !self.image.nil?
  end

  def get_image
    self.has_image? ? (return self.image) : (return IMAGES.shuffle.first)
  end

  def has_internship?
    return !self.company.nil?
  end

end
