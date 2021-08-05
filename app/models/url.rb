class Url < ApplicationRecord

  validates :slug, uniqueness: true, allow_blank: false

  def generate_short_url
    self.slug = SecureRandom.urlsafe_base64(5).downcase
  end
end
