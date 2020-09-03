class Payment

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone, :item_id, :user_id, :token
  with_options presence: true do
    validates :postal_code, null: false, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, null:false
    validates :city,  null: false
    validates :address, null: false
    validates :phone,  null: false, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
   
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone: phone , order_id: order.id)
  end
end
