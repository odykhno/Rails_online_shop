class CategoriesController < ApplicationController

  def create
    @category = current_admin.categories.build(permitted_params[:category])
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
  end

  def new
  end

  def edit
  end

  def delete
  end

end
