require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
    @address = FactoryBot.build(:address)
end

describe "カード決済" do
  context 'カード決済がうまくいくとき' do
    it "postal_codeとprefecture_idとcityとaddressとphoneとorderが存在すればカード決済できる" do
    end
  end

  context "カード決済がうまくいかないとき" do
    it "postal_codeにハイフン(-)がなければ決済できない" do
    end
    it "postal_codeとprefecture_idとcityとaddressとphoneがなければ決済できない"　do
    end
    it "phoneはハイフン(-)不要で、11桁いないでなければ決済できない" do
    end
  end
end
