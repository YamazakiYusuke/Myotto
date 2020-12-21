require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    locales = ['en', 'ja', 'ru']
    locales.each do |n|
      Locale.create!(
        name: n
      )
    end
  end

  # describe 'アカウント作成', type: :system do
  #   it 'アカウントを作成' do
  #     visit new_user_path
  #     fill_in 'user_name', with: 'ゆうすけ'
  #     select 'ja', from: 'user[user_locale_statuses_attributes][0][locale_id]'
  #     select 'ru', from: 'user[user_locale_statuses_attributes][1][locale_id]'
  #     select 'Elementary', from: 'user[user_locale_statuses_attributes][1][wanted_level]'
  #     fill_in 'user_email', with: 'yusuke@gmail.com'
  #     fill_in 'user_password', with: 'hogehoge'
  #     fill_in 'user_password_confirmation', with: 'hogehoge'
  #     click_on 'commit'
  #     expect(page).to have_content 'みんなの翻訳'
  #   end
  # end
  describe 'ログイン後の操作' do
    before do 
      visit new_user_path
      fill_in 'user_name', with: 'よこい'
      select 'ru', from: 'user[user_locale_statuses_attributes][0][locale_id]'
      select 'ja', from: 'user[user_locale_statuses_attributes][1][locale_id]'
      select 'Elementary', from: 'user[user_locale_statuses_attributes][1][wanted_level]'
      fill_in 'user_email', with: 'yokoi@gmail.com'
      fill_in 'user_password', with: 'hogehoge'
      fill_in 'user_password_confirmation', with: 'hogehoge'
      click_on 'commit'
      click_on 'ログアウト'

      visit new_user_path
      fill_in 'user_name', with: 'ゆうすけ'
      select 'ja', from: 'user[user_locale_statuses_attributes][0][locale_id]'
      select 'ru', from: 'user[user_locale_statuses_attributes][1][locale_id]'
      select 'Elementary', from: 'user[user_locale_statuses_attributes][1][wanted_level]'
      fill_in 'user_email', with: 'yusuke@gmail.com'
      fill_in 'user_password', with: 'hogehoge'
      fill_in 'user_password_confirmation', with: 'hogehoge'
      click_on 'commit'
    end
    # it 'ログアウト' do
    #   click_on 'ログアウト'
    #   expect(page).to have_content 'ログイン'
    # end
    # describe 'User#show' do
    #   it 'マイページの表示' do
    #     click_on 'マイページ'
    #     expect(page).to have_content 'ゆうすけ'
    #     expect(page).to have_content 'プロフィールを編集'
    #   end
    #   it '他人のuser#showを表示' do
    #     visit user_path(User.find_by(name: 'よこい').id)
    #     expect(page).to have_content 'よこい'
    #     expect(page).not_to have_content 'プロフィールを編集'
    #     expect(page).to have_content 'フォロー'
    #   end
    # end 
    describe '管理者' do
      before do
        binding.pry
      end
    end
    describe 'マイページ' do
      before do
        click_on 'マイページ'
      end
      # it 'プロフィールを編集' do
      #   click_on 'プロフィールを編集'
      #   fill_in 'user_name', with: '友輔'
      #   fill_in 'user_password', with: 'hogehoge'
      #   fill_in 'user_password_confirmation', with: 'hogehoge'
      #   click_on 'commit'
      #   expect(page).to have_content '友輔'
      # end
      describe '自分の投稿' do
        before do
          click_on 'マイページ'
        end
      end
    end
  end
end