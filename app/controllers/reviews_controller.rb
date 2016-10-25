class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product) }
        format.json { render json: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:text, :rating)
  end
end
