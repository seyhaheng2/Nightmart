ActiveAdmin.register Post do

  menu priority: 3
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :name, :image, :description, :video, :category_id, :countclick
  index do
    column :name
    column :iamge do |img|
      image_tag img.image, size: "110x80"
    end
    column :description do |desc|
      truncate(desc.description.html_safe, legnth: 120)
    end
    column :category_id do |cate|
      cate.category.name
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Detail" do
      f.input :name
      f.input :image
      f.input :description, as: :ckeditor
      f.input :category
    end
    f.actions
  end
end
