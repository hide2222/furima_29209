class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :ship_schedule

  

  with_options presence: true do
  validates :prefecture
  validates :category
  validates :status
  validates :ship_fee
  validates :ship_schedule
  validates :price
  validates :name
  validates :item_detail
  end
      
  with_options numericality: { other_than: 0 } do
  validates :prefecture_id
  validates :category_id
  validates :status_id
  validates :ship_fee_id
  validates :ship_schedule_id
  end
 end
