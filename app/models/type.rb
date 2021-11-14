class Type < ApplicationRecord
    has_many :bookmarks, dependent: :destroy

    validates :name, presence: true

    def to_s
        name
    end
end
