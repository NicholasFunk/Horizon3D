ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :category_id, :image
  filter :image_attachment_id

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions
  end
end
