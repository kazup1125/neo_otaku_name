class OtakuWordsController < ApplicationController
  before_action :set_otaku_word, only: :show

  def index
    @otaku_words = OtakuWord.all
  end

  def show
    @otaku_word = OtakuWord.find(params[:id])
  end

  private

  def set_otaku_word
    @otaku_word = OtakuWord.find(params[:id])
  end
end
