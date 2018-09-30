class Article < ApplicationRecord

    has_many :tag, inverse_of: :article

    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true
end
