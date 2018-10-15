class Article < ApplicationRecord

    has_many :tag, inverse_of: :article

    before_save { self.slug = slug.gsub(/\s+/, '-').downcase }
    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true
end
