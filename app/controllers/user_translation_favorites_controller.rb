class UserTranslationFavoritesController < ApplicationController
  def create
    favorite = current_user.user_translation_favorites.create(translation_id: params[:translation_id])
    redirect_to translation_path(favorite.translation_id), notice: "#{favorite.translation.user.name}さんの翻訳をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.user_translation_favorites
    .find_by(id: params[:id]).destroy
    redirect_to translation_path(favorite.translation_id), notice: "#{favorite.translation.user.name}さんの翻訳をお気に入り解除しました"
  end
end
