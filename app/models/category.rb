class Category < ApplicationRecord  
  has_many :sub_categories, class_name: "Category", foreign_key: "category_id", dependent: :destroy						
  belongs_to :main_category, class_name: "Category", foreign_key: "category_id", optional: true	

  has_many :bookmarks, dependent: :destroy

  before_update :update_visibility

  validates :name, presence: true

  def to_s
    name
  end

  def update_visibility
    status = self.visibility
    self.sub_categories.each do |s|
      s.visibility = status
      s.save
    end
  end
end
