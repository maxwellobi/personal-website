class AddArticleIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :article, foreign_key: true
  end
end
