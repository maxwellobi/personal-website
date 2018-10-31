class Article < ApplicationRecord

    has_many :tags, inverse_of: :article, dependent: :destroy

    before_save { self.slug = slug.gsub(/\s+/, '-').downcase }
    validates :title, presence: true
    validates :article, presence: true
    validates :published_at, presence: true
    validates :slug, presence: true, uniqueness: true
end
