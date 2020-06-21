class OtakuWordsController < ApplicationController
  before_action :set_otaku_word, only: :show

  def index
    @q = OtakuWord.ransack(params[:q])
    @otaku_words = @q.result(distinct: true)
  end

  def show
    @otaku_word = OtakuWord.find(params[:id])
  end

  private

  def set_otaku_word
    @otaku_word = OtakuWord.find(params[:id])
  end
end
