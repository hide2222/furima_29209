require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
     #試行錯誤記念に残してあります。@item.image = fixture_file_upload('sample1.png')
  end
  describe 'ユーザー商品出品' do
    context '商品出品ががうまくいくとき' do
      it "imageとnameとitem_detailとpriceとcategory_idとstatus_idとship_fee_idとprefecture_idとship_schedule_idとpriceが存在すれば出品登録できる" do
      
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "item_detailが空だと登録できない" do
        @item.item_detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "status_idが空だと登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "ship_fee_idが空だと登録できない" do
        @item.ship_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship fee is not a number")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "ship_schedule_idが空だと登録できない" do
        @item.ship_schedule_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship schedule is not a number")
      end
  
      it "priceは半角数字で書く必要がある" do
        @item.price = "２３４あい"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceは300円以上で記載しなければ登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
      it "priceは9999999円以上では登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

    end
  end
end
