class Api::V1::OtakuWordsController < ApiController
  before_action :set_otaku_word, only: :show

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    @q = OtakuWord.ransack(params[:q])
    @otaku_words = @q.result(distinct: true).order(:created_at)
  end

  def show
    @otaku_word = OtakuWord.find(params[:id])
  end

  private

  def set_otaku_word
    @otaku_word = OtakuWord.find(params[:id])
  end
end

