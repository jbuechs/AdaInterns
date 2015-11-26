class Employee < ActiveRecord::Base
  belongs_to :company
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :company_id, presence: true

  def full_name
    return first_name + " " + last_name
  end

  def has_image?
    return !self.image.blank?
  end

  def has_contact?
    return self.has_twitter? || self.has_linkedin? || self.has_email?
  end

  def has_twitter?
    return !self.twitter.blank?
  end

  def has_linkedin?
    return !self.linkedin.blank?
  end

  def has_email?
    return !self.email.blank?
  end
end
