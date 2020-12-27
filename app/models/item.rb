class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :days


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
