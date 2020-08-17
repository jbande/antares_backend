class StaticTextsController < ApplicationController
  before_action :set_static_text, only: [:show, :edit, :update, :destroy]

  # GET /static_texts
  # GET /static_texts.json
  def index
    @static_texts = StaticText.all
  end

  # GET /static_texts/1
  # GET /static_texts/1.json
  def show
  end

  # GET /static_texts/new
  def new
    @static_text = StaticText.new
  end

  # GET /static_texts/1/edit
  def edit
  end

  # POST /static_texts
  # POST /static_texts.json
  def create
    @static_text = StaticText.new(static_text_params)

    respond_to do |format|
      if @static_text.save
        format.html { redirect_to @static_text, notice: 'Static text was successfully created.' }
        format.json { render :show, status: :created, location: @static_text }
      else
        format.html { render :new }
        format.json { render json: @static_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /static_texts/1
  # PATCH/PUT /static_texts/1.json
  def update
    respond_to do |format|
      if @static_text.update(static_text_params)
        format.html { redirect_to @static_text, notice: 'Static text was successfully updated.' }
        format.json { render :show, status: :ok, location: @static_text }
      else
        format.html { render :edit }
        format.json { render json: @static_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /static_texts/1
  # DELETE /static_texts/1.json
  def destroy
    @static_text.destroy
    respond_to do |format|
      format.html { redirect_to static_texts_url, notice: 'Static text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static_text
      @static_text = StaticText.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def static_text_params
      params.fetch(:static_text, {})
    end
end
