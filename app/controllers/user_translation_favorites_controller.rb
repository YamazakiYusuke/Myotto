class UserTranslationFavoritesController < ApplicationController
  before_action :authenticate_user, only: [:index, :show]
  def create
    favorite = current_user.user_translation_favorites.create(translation_id: params[:translation_id])
    redirect_to translation_path(favorite.translation_id)
  end
  def destroy
    favorite = current_user.user_translation_favorites
    .find_by(id: params[:id]).destroy
    redirect_to translation_path(favorite.translation_id)
  end
end
