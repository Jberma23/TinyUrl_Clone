class TinyUrl < ApplicationRecord
  belongs_to :user
  has_many :url_visitors, dependent: :destroy

  validates_presence_of :new_url, :original_url

  before_validation :build_new_url

  def formatted_original_url
    url = URI.parse(original_url)
    url.scheme.present? ? original_url : 'http://' + url.path
  end

  private

  def build_new_url
    loop do
      self.new_url = SecureRandom.hex(7)
      break if TinyUrl.where(new_url: self.new_url).empty?
    end
  end
end
