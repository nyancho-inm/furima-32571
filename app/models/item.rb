class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :fee_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :price, format: {with: 	/^[0-9]*$/}, length: {minimum: 300, maximum: 9,999,999}
  end
end
