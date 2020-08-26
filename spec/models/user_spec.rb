require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationとfamily_nameとfirst_nameとfamily_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        expect(@user).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailには@を含めなければ登録できない" do
      @user.email = "xxxpppko"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "psswordは二回同じパスワードを入力しなければ登録できない" do
      @user.password_confirmation = "ホゲホゲ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birthday_idが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    
    it "passwordは5文字以下では登録できない" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数混合で書く必要がある" do
      @user.password ="かかかかか"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "family_nameは全角漢字、ひらがな、カタカナ混合で書く必要がある" do
      @user.family_name = "ABE"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameは全角漢字、ひらがな、カタカナ混合で書く必要がある" do
      @user.first_name = "ABE"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "family_nameは全角カタカナ混合で書く必要がある" do
      @user.family_name_kana = "ABE"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "family_nameは全角カタカナ混合で書く必要がある" do
      @user.first_name_kana = "ABE"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
  end
end
