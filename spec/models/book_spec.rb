require 'rails_helper'

RSpec.describe Book, type: :model do
  # describe 'make sentences from book' do
  #   before do
  #     click_on '新規登録'
  #     fill_in 'user_name', with: 'ゆうすけ'
  #     select 'ja', from: 'user[user_locale_statuses_attributes][0][locale_id]'
  #     select 'ru', from: 'user[user_locale_statuses_attributes][1][locale_id]'
  #     select 'Elementary', from: 'user[user_locale_statuses_attributes][1][wanted_level]'
  #     fill_in 'user_email', with: 'yusuke@gmail.com'
  #     fill_in 'user_password', with: 'hogehoge'
  #     fill_in 'user_password_confirmation', with: 'hogehoge'
  #     click_on 'commit'
  #     user = User.last
  #     user.update!(admin: true, password: 'hogehoge', password_confirmation: 'hogehoge' )
  #     visit new_book_path
  #   end
  #   it 'en' do
  #     fill_in 'book[title]', with: 'Alice’s Adventures in Wonderland'
  #     fill_in 'book[author]', with: 'Lewis Carroll'
  #     select 'Intermediate', from: 'book[book_locale_statuses_attributes][0][difficulty]'
  #     select 'en', from: 'book[book_locale_statuses_attributes][0][locale_id]'
  #     fill_in 'book[content]', with: "Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, “and what is the use of a book,” thought Alice “without pictures or conversations?”
  #     So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her."
  #     click_on 'commit'
  #     click_on '読む'
  #     expect(page).to have_content 'Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, “and what is the use of a book,” thought Alice “without pictures or conversations?'
  #     expect(page).to have_content '”So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.'
  #   end
  #   it 'ja' do
  #     fill_in 'book[title]', with: '羅生門'
  #     fill_in 'book[author]', with: '芥川龍之介'
  #     select 'Intermediate', from: 'book[book_locale_statuses_attributes][0][difficulty]'
  #     select 'ja', from: 'book[book_locale_statuses_attributes][0][locale_id]'
  #     fill_in 'book[content]', with: 'ある日の暮方の事である。一人の下人げにんが、羅生門らしょうもんの下で雨やみを待っていた。'
  #     click_on 'commit'
  #     click_on '読む'
  #     expect(page).to have_content 'ある日の暮方の事である。'
  #     expect(page).to have_content '一人の下人げにんが、羅生門らしょうもんの下で雨やみを待っていた。'
  #   end
  #   it 'ru' do
      
  #   end
  # end
end
