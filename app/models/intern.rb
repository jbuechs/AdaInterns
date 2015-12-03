class Intern < ActiveRecord::Base
  belongs_to :company

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :cohort, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  IMAGES = ["ada1.jpg", "ada2.png", "barbie.jpg", "grace1.jpg", "grace2.jpg" ]

  def full_name
    return first_name + " " + last_name
  end

  def has_image?
    return !self.image.blank?
  end

  def has_contact?
    return self.has_twitter? || self.has_linkedin?
  end

  def has_twitter?
    return !self.twitter.blank?
  end

  def has_linkedin?
    return !self.linked_in.blank?
  end

  def get_image
    self.has_image? ? (return self.image) : (return IMAGES.shuffle.first)
  end

  def has_internship?
    return !self.company.nil?
  end

end
