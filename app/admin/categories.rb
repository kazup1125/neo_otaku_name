# frozen_string_literal: true

ActiveAdmin.register Category do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :_destroy

  ## 入力フォーム
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.actions
    end
  end

  ## 一覧画面
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :created_at
    column :updated_at
    actions
  end

  ## 詳細画面
  show do
    attributes_table do
      row :id do
        resource.id
      end
      row :name do
        resource.name
      end
      row :description do
        resource.description
      end
      row :created_at do
        resource.created_at
      end
      row :updated_at do
        resource.updated_at
      end
    end
  end
end
