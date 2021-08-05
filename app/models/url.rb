class Url < ApplicationRecord
  URL_REGEX = %r(\A(?:https?://)?(?:\w+\.)(?:\.?\w{2,})+\z).freeze
  DEFAULT_DOMAIN = 'http://localhost:3000/'.freeze

  validates :original, presence: true, format: { with: URL_REGEX, message: 'please enter a correct url'}
  validates :slug, uniqueness: true, allow_blank: false

  def generate_short_url
    self.slug = SecureRandom.urlsafe_base64(5).downcase
  end

  def shortened_url(domain = DEFAULT_DOMAIN)
    "#{domain}#{slug}"
  end

  def update_stats(ip)
    update(visitors_count: visitors_count + 1, visitors_ips: visitors_ips.push(ip))
  end
end
