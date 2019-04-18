require 'rails_helper'

describe Item do
  describe '#create' do
    it "is valid with a name, price, description, user_id, size, condition, delivery_fee, delivery_way, delivery_area, delivery_date, created_at, updated_at" do
      user = create(:user)
      item = build(:item, user_id: user.id)
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      user = create(:user)
      item = build(:item, user_id: user.id, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("が入力されていません。")
    end

    it "is invalid without a price" do
      user = create(:user)
      item = build(:item, user_id: user.id, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("が入力されていません。")
    end

    it "is invalid without a description" do
      user = create(:user)
      item = build(:item, user_id: user.id, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("が入力されていません。")
    end

    it "is invalid without a size" do
      user = create(:user)
      item = build(:item, user_id: user.id, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("が入力されていません。")
    end

    it "is invalid without a delivery_fee" do
      user = create(:user)
      item = build(:item, user_id: user.id, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("が入力されていません。")
    end

    it "is invalid without a delivery_way" do
      user = create(:user)
      item = build(:item, user_id: user.id, delivery_way: nil)
      item.valid?
      expect(item.errors[:delivery_way]).to include("が入力されていません。")
    end

    it "is invalid without a delivery_date" do
      user = create(:user)
      item = build(:item, user_id: user.id, delivery_date: nil)
      item.valid?
      expect(item.errors[:delivery_date]).to include("が入力されていません。")
    end

    it "is invalid without a delivery_area" do
      user = create(:user)
      item = build(:item, user_id: user.id, delivery_area: nil)
      item.valid?
      expect(item.errors[:delivery_area]).to include("が入力されていません。")
    end

    it "is invalid without a user_id" do
      user = create(:user)
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("が入力されていません。")
    end


    it "is invalid with an item's name that has more than 41 characters" do
      user = create(:user)
      item = build(:item, name: "あ"*41, user_id: user.id)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以下に設定して下さい。")
    end

    it "is valid with an item's name that has less than 40 characters" do
      user = create(:user)
      item = build(:item, name: "あ"*39, user_id: user.id)
      expect(item).to be_valid
    end

    it "is invalid with an item's description that has more than 1000 characters" do
      user = create(:user)
      item = build(:item, description: "あ"*1001, user_id: user.id)
      item.valid?
      expect(item.errors[:description]).to include("は1000文字以下に設定して下さい。")
    end

    it "is valid with an item's description that has less than 1000 characters" do
      user = create(:user)
      item = build(:item, description: "あ"*999, user_id: user.id)
      expect(item).to be_valid
    end

    it "is invalid with an item's price that has more than 10000000" do
      user = create(:user)
      item = build(:item, price: 10000000, user_id: user.id)
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "is invalid with an item's price that has less than 299" do
      user = create(:user)
      item = build(:item, price: 299, user_id: user.id)
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "is invalid with an item's price that has not integer" do
      user = create(:user)
      item = build(:item, price: 3000.1, user_id: user.id)
      item.valid?
      expect(item.errors[:price]).to include("は整数で入力してください")
    end
  end

end
