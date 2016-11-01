class ReviewsController < ApplicationController
  # before_action :find_approved_comments, :only => [:show, :save]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    respond_to do |format|
      if @review.save
        flash[:confirmation] = 'This review will be published after the administrator confirm'
        format.html { redirect_to product_path(@product) }
        format.json { render json: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   @review = Review.find(params[:id])
  #   if @review.update(review_params)
  #     redirect_to @review
  #   else
  #     render 'edit'
  #   end
  # end

  # def show
  # end

  private
  def review_params
    params.require(:review).permit(:text, :rating, :approved)
  end

  def find_not_approved_reviews
    @reviews = []
    products = Product.all
    unless products.nil?
      products.each do |product|
        product.reviews.where(approved: false).each do |review|
          @reviews << review
        end
      end
    end
    @reviews
  end
end
