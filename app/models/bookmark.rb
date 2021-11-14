class Bookmark < ApplicationRecord
    belongs_to :type
    belongs_to :category

    validates :title, presence: true
    validates :url, presence: true
    validates :type_id, presence: true
    validates :category_id, presence: true
end
