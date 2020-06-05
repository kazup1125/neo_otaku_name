class OtakuWordsController < ApplicationController
  def index
    @otaku_words = OtakuWord.all
  end

  def show
    @otaku_word = OtakuWord.find(params[:id])
  end
end
