class OtakuWordsController < ApplicationController
  before_action :set_otaku_word, only: [:show, :edit, :update, :destroy]

  # GET /otaku_words
  # GET /otaku_words.json
  def index
    @q = OtakuWord.ransack(params[:q])
    @otaku_words = @q.result(distinct: true).order(:created_at)
  end

  # GET /otaku_words/1
  # GET /otaku_words/1.json
  def show; end

  # GET /otaku_words/new
  def new
    @otaku_word = OtakuWord.new
  end

  # GET /otaku_words/1/edit
  def edit; end

  # POST /otaku_words
  # POST /otaku_words.json
  def create
    @otaku_word = OtakuWord.new(otaku_word_params)

    respond_to do |format|
      if @otaku_word.save
        format.html { redirect_to @otaku_word, notice: 'Otaku word was successfully created.' }
        format.json { render :show, status: :created, location: @otaku_word }
      else
        format.html { render :new }
        format.json { render json: @otaku_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /otaku_words/1
  # PATCH/PUT /otaku_words/1.json
  def update
    respond_to do |format|
      if @otaku_word.update(otaku_word_params)
        format.html { redirect_to @otaku_word, notice: 'Otaku word was successfully updated.' }
        format.json { render :show, status: :ok, location: @otaku_word }
      else
        format.html { render :edit }
        format.json { render json: @otaku_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /otaku_words/1
  # DELETE /otaku_words/1.json
  def destroy
    @otaku_word.destroy
    respond_to do |format|
      format.html { redirect_to otaku_words_url, notice: 'Otaku word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_otaku_word
      @otaku_word = OtakuWord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def otaku_word_params
      params.fetch(:otaku_word, {})
    end
end
