ActiveAdmin.register Review do
  permit_params :text, :product_id, :rating, :approved

  form do |f|
    f.inputs 'Reviews' do
      f.input :text
      f.input :product_id
      f.input :rating
      f.input :approved, as: :select, collection: [true, false]
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :text
    column :product_id
    column :rating
    column :approved
  end

  show do
    attributes_table do
      row :text
      row :product_id
      row :rating
      row :approved
    end
  end

  batch_action :approved do |ids|
    Review.find(ids).each do |review|
      review.update(approved: true)
      review.product.update(rating: average_rating(review.product))
    end
    redirect_to collection_path, alert: "The reviews have been approved."
  end

  controller do
    def average_rating(product)
      sum = 0
      product.reviews.each do |review|
        sum += review.rating
      end
      product.reviews.count == 0 ? 0 : sum/product.reviews.count
    end
  end
end
