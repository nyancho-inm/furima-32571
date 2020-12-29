class Item < ApplicationRecord  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day


  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :category_id, numericality:{ other_than: 1 ,message: 'Select'}
    validates :condition_id, numericality: { other_than: 1 ,message: 'Select'}
    validates :fee_id, numericality: { other_than: 1 ,message: 'Select'}
    validates :area_id, numericality: { other_than: 1 ,message: 'Select'}
    validates :day_id, numericality: { other_than: 1 ,message: 'Select'}
    VALID_PRICE_HALF = /\A[0-9]+\z/
    validates :price, numericality: { with: VALID_PRICE_HALF, message: 'Half-width number'}               
  end
  validates :price, numericality: { greater_than: 299, less_than: 10000000, message: 'Out of setting range' }
  
end
