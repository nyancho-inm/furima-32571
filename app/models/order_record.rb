class OrderRecord
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :postal, :prefecture_id, :municipalities, :address, :phone, :building

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0 ,message: 'Select'}
    validates :municipalities
    validates :address
    validates :phone, numericality: { with: /\A\d{11}\z/, message: "number Input only number" }
    validates :user_id
    validates :item_id
  end
  

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Order.create(postal: postal, prefecture_id: prefecture_id, municipalities: municipalities, address: address, phone: phone, building: building, record_id: record.id)
  end
end