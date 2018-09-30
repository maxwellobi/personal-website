class Tag < ApplicationRecord
    belongs_to :article
    validates :article, presence: true
end
