class Account::FaqsController < ApplicationController
  before_action :set_account_faq, only: [:show, :edit, :update, :destroy]

  # GET /account/faqs
  # GET /account/faqs.json
  def index
    @account_faqs = Account::Faq.all
  end

  # GET /account/faqs/1
  # GET /account/faqs/1.json
  def show
  end

  # GET /account/faqs/new
  def new
    @account_faq = Account::Faq.new
  end

  # GET /account/faqs/1/edit
  def edit
  end

  # POST /account/faqs
  # POST /account/faqs.json
  def create
    @account_faq = Account::Faq.new(account_faq_params)

    respond_to do |format|
      if @account_faq.save
        format.html { redirect_to @account_faq, notice: 'Faq was successfully created.' }
        format.json { render :show, status: :created, location: @account_faq }
      else
        format.html { render :new }
        format.json { render json: @account_faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/faqs/1
  # PATCH/PUT /account/faqs/1.json
  def update
    respond_to do |format|
      if @account_faq.update(account_faq_params)
        format.html { redirect_to @account_faq, notice: 'Faq was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_faq }
      else
        format.html { render :edit }
        format.json { render json: @account_faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/faqs/1
  # DELETE /account/faqs/1.json
  def destroy
    @account_faq.destroy
    respond_to do |format|
      format.html { redirect_to account_faqs_url, notice: 'Faq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_faq
      @account_faq = Account::Faq.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_faq_params
      params.require(:account_faq).permit(:title, :description)
    end
end
