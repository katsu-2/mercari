require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do
    it "ニックネーム、メールアドレス、苗字、名前、苗字カナ、名前カナがあれば有効" do
      expect(build(:user)).to be_valid
    end

    it "ニックネームがないと無効" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end

    it "重複するニックネームは無効" do
      user = create(:user, nickname: "taro")
      other_user = build(:user, nickname: "taro")
      other_user.valid?
      expect(other_user.errors[:nickname]).to include("は既に使用されています。")
    end

    it "メールアドレスが無いと無効" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "重複するメールアドレスは無効" do
      user = create(:user, email: "tester@example.com")
      other_user = build(:user, email: "tester@example.com")
      other_user.valid?
      expect(other_user.errors[:email]).to include("は既に使用されています。")
    end

    it "パスワードが無いと無効" do
      user = build(:user, password:nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "パスワードが6文字以内は無効" do
      user = build(:user, password: "fooba")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end

    it "苗字がないと無効" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("が入力されていません。")
    end

    it "名前がないと無効" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("が入力されていません。")
    end

    it "苗字カナがないと無効" do
      user = build(:user, family_kana: nil)
      user.valid?
      expect(user.errors[:family_kana]).to include("が入力されていません。")
    end

    it "名前カナがないと無効" do
      user = build(:user, first_kana: nil)
      user.valid?
      expect(user.errors[:first_kana]).to include("が入力されていません。")
    end

  end
end
