require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @buy_user = FactoryBot.create(:user)
    @sell_user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @sell_user.id)
    @payment = FactoryBot.build(:payment, user_id: @buy_user.id,item_id:@item.id)
end

describe "購入手続き完了" do
context '商品購入手続きががうまくいくとき' do
  it "postal_codeとprefecture_idとcityとaddressとphoneとtokenが存在すれば購入手続きできる" do
    expect(@payment). to be_valid
  end
end

context "商品購入手続きががうまくいかないとき" do
  it "postal_codeにハイフン(-)がなければ購入手続きできない" do
    @payment.postal_code ="9876543"
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Postal code is invalid")
  end
  it "phoneはハイフン(-)不要で、11桁以内でなければ購入手続きできない" do
    @payment.phone = "0192-83746-5612"
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Phone is invalid")
  end
  it "postal_codeが空だと購入手続きできない" do
    @payment.postal_code = ""
    @payment.valid?
   expect(@payment.errors.full_messages).to include("Postal code can't be blank")
  end
  it "cityが空だと購入手続きできない" do
    @payment.city = ""
    @payment.valid?
    expect(@payment.errors.full_messages).to include("City can't be blank")
  end
  it "addressが空だと購入手続きできない" do
    @payment.address =""
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Address can't be blank")
  end
  it "phoneが空だと購入手続きできない" do
    @payment.phone = ""
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Phone can't be blank")
  end
  it "tokenが空だと購入完了できない" do
    @payment.token =""
    @payment.valid?
    expect(@payment.errors.full_messages).to include("Token is invalid")
  end
end
end
end

