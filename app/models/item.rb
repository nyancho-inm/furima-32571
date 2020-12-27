class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day


  with_options presence: true do
    validates :item_name
    validates :description
    validates :image
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :fee_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :price, format: {with: /\A[a-zA-Z0-9]+\z/}, length: {minimum: 300, maximum: 9999999}
  end
end
