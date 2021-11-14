class AddTypeToBookmark < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookmarks, :type, foreign_key: true
  end
end
