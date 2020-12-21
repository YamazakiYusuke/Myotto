require 'rails_helper'

# 注意このテストのlocaleは日本を前提として作っています

RSpec.describe 'Users', type: :system do
  before do
    locales = ['en', 'ja', 'ru']
    locales.each do |n|
      Locale.create!(
        name: n
      )
    end
  end

  describe 'アカウント作成', type: :system do
    it 'アカウントを作成' do
      visit new_user_path
      fill_in 'user_name', with: 'ゆうすけ'
      select 'ja', from: 'user[user_locale_statuses_attributes][0][locale_id]'
      select 'ru', from: 'user[user_locale_statuses_attributes][1][locale_id]'
      select 'Elementary', from: 'user[user_locale_statuses_attributes][1][wanted_level]'
      fill_in 'user_email', with: 'yusuke@gmail.com'
      fill_in 'user_password', with: 'hogehoge'
      fill_in 'user_password_confirmation', with: 'hogehoge'
      click_on 'commit'
      expect(page).to have_content 'みんなの翻訳'
    end
  end

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
      click_on '本一覧'
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

    describe '管理者' do
      before do
        user = User.last
        user.update!(admin: true, password: 'hogehoge', password_confirmation: 'hogehoge' )
        visit new_book_path
      end
      it '新しい本を作成' do
        fill_in 'book[title]', with: '羅生門'
        fill_in 'book[author]', with: '芥川龍之介'
        select 'Intermediate', from: 'book[book_locale_statuses_attributes][0][difficulty]'
        select 'ja', from: 'book[book_locale_statuses_attributes][0][locale_id]'
        fill_in 'book[content]', with: 'ある日の暮方の事である。'
        click_on 'commit'
        expect(page).to have_content '羅生門'
      end
      describe '本を作成' do
        before do
          fill_in 'book[title]', with: '羅生門'
          fill_in 'book[author]', with: '芥川龍之介'
          select 'Intermediate', from: 'book[book_locale_statuses_attributes][0][difficulty]'
          select 'ja', from: 'book[book_locale_statuses_attributes][0][locale_id]'
          fill_in 'book[content]', with: 'ある日の暮方の事である。'
          click_on 'commit'
        end
        describe '本を' do
          it '編集できる' do
            click_on '編集'
            fill_in 'book[title]' ,with: '羅生門編集後'
            click_on 'commit'
            expect(page).to have_content '羅生門編集後'
          end
          it '削除できる' do
            click_on '削除'
            page.driver.browser.switch_to.alert.accept
            expect(page).not_to have_content '羅生門'
          end
          describe 'センテンスを' do
            before do 
              click_on '読む'
            end
            it '編集できる' do
              click_on '編集'
              fill_in 'sentence[content]', with: 'センテンスを編集しました'
              click_on 'commit'
              expect(page).to have_content 'センテンスを編集しました'
            end
            it '削除できる' do
              click_on '削除'
              page.driver.browser.switch_to.alert.accept
              expect(page).not_to have_content 'ある日の暮方の事である。'
            end
          end
        end
      end
    end
    describe 'ログイン ログアウト' do
      it 'ログアウト' do
        click_on 'ログアウト'
        expect(page).to have_content 'ログイン'
      end
      it 'ログイン' do
        click_on 'ログアウト'
        fill_in 'session[email]', with: 'yusuke@gmail.com'
        fill_in 'session[password]', with: 'hogehoge'
        click_on 'commit'
        expect(page).to have_content 'みんなの翻訳'
      end
    end
    describe 'User#show' do
      it 'マイページの表示' do
        click_on 'マイページ'
        expect(page).to have_content 'ゆうすけ'
        expect(page).to have_content 'プロフィールを編集'
      end
      it '他人のuser#showを表示' do
        visit user_path(User.find_by(name: 'よこい').id)
        expect(page).to have_content 'よこい'
        expect(page).not_to have_content 'プロフィールを編集'
        expect(page).to have_content 'フォロー'
      end
    end 
    describe 'マイページ' do
      before do
        click_on 'マイページ'
      end
      it 'プロフィールを編集' do
        click_on 'プロフィールを編集'
        fill_in 'user_name', with: '友輔'
        fill_in 'user_password', with: 'hogehoge'
        fill_in 'user_password_confirmation', with: 'hogehoge'
        click_on 'commit'
        expect(page).to have_content '友輔'
      end
    end
    describe '本の作成されたフィールド' do 
      describe '翻訳' do
        before do
          user = User.last
          user.update!(admin: true, password: 'hogehoge', password_confirmation: 'hogehoge' )
          visit books_path
          visit new_book_path
          fill_in 'book[title]', with: '羅生門'
          fill_in 'book[author]', with: '芥川龍之介'
          select 'Intermediate', from: 'book[book_locale_statuses_attributes][0][difficulty]'
          select 'ja', from: 'book[book_locale_statuses_attributes][0][locale_id]'
          fill_in 'book[content]', with: 'ある日の暮方の事である。'
          click_on 'commit'
        end
        it '投稿' do
          click_on '読む'
          click_on '翻訳する'
          fill_in 'translation[content]', with: 'テスト翻訳'
          click_on 'commit'
          expect(page).to have_content 'テスト翻訳'
        end
        describe '自分の投稿をedit destroy' do
          before do
            click_on '読む'
            click_on '翻訳する'
            fill_in 'translation[content]', with: 'テスト翻訳'
            click_on 'commit'
          end
          it '編集' do
            click_on '編集'
            fill_in 'translation[content]', with: '編集しました'
            click_on 'commit'
            expect(page).to have_content '編集しました'
          end
          it '削除' do
            click_on '削除'
            page.driver.browser.switch_to.alert.accept
            expect(page).not_to have_content 'テスト翻訳'
          end
        end
        describe '他のユーザー' do
          before do
            click_on '読む'
            click_on '翻訳する'
            fill_in 'translation[content]', with: 'テスト翻訳'
            click_on 'commit'
            click_on 'ログアウト'
            fill_in 'session[email]', with: 'yokoi@gmail.com'
            fill_in 'session[password]', with: 'hogehoge'
            click_on 'commit'
          end
          describe '一般User' do
            describe '本' do
              describe 'book#newできない' do
                it 'book#newボタンがない' do
                  click_on '本一覧'
                  expect(page).not_to have_content '新しく本を登録'
                end
                it 'pathをURLに入力してもはじかれる' do
                  visit new_book_path
                  expect(page).to have_content '管理権限がありません'
                end
              end
              it '編集、削除が表示されない' do
                click_on '本一覧'
                expect(page).not_to have_content '編集'
                expect(page).not_to have_content '削除'
              end
            end
            describe 'センテンス' do
              it '編集、削除が表示されない' do
                click_on '本一覧'
                click_on '読む'
                expect(page).not_to have_content '編集'
                expect(page).not_to have_content '削除'
              end
            end
          end
          describe '投稿' do
            before do
              click_on '詳細'
            end
            describe 'like' do
              it 'Like' do
                click_on 'Like!'
                expect(page).to have_content 'Remove Like'
              end
              it 'Like解除' do
                click_on 'Like!'
                click_on 'Remove Like'
                expect(page).to have_content 'Like!'
              end
            end
            describe 'コメント' do
              it 'コメンできる' do
                fill_in 'user_translation_comment[content]',with: 'テストコメント'
                click_on 'commit'
                expect(page).to have_content 'テストコメント'
              end
            end
          end
        end
      end
    end
  end
end