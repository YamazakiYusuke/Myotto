require 'rails_helper'

RSpec.describe Translation, type: :model do
  it 'name, email, passwordがあるので有効' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  it 'nameがないので無効' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  it "重複したメールアドレスの場合、無効である" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:email]).to include("はすでに存在します")
  end
  it 'パスワードがない場合、無効である' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください", "は6文字以上で入力してください")
  end
end
