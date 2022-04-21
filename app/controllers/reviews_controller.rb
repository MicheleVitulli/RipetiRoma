# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews or /reviews.json
  def create
    @recensito = User.find(params[:user_id])
    @review = @recensito.reviews.create(review_params)
    # redirect_to user_path(@recensito)
    # render :text => params[:review_params][:testo]
    redirect_to user_path(@recensito) if @review.save
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    redirect_to request.referrer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    p = params.require(:review).permit(:testo, :valutazione, :reviewer)
    { testo: p[:testo], valutazione: p[:valutazione], reviewer: current_user }
  end
end
