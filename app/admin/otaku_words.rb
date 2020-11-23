# frozen_string_literal: true

ActiveAdmin.register OtakuWord do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :word, :meaning, :description,
                category_and_otaku_word_relationships_attributes: %i[id category_id _destroy]

  ## 入力フォーム
  form do |f|
    f.inputs do
      f.input :word
      f.input :meaning
      f.input :description
      f.has_many :category_and_otaku_word_relationships, allow_destroy: true do |r|
        r.input :category,
                label: 'カテゴリー',
                as: :select,
                collection: Category.all
      end
      f.actions
    end
  end

  ## 一覧画面
  index do
    selectable_column
    id_column
    column :word
    column :meaning
    column :category_id do |word|
      word.categories.each(&:name)
    end
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
      row :word do
        resource.word
      end
      row :meaning do
        resource.meaning
      end
      row :description do
        resource.description
      end
      row 'カテゴリ' do
        resource.categories.each(&:name)
      end
      row '作成日' do
        resource.created_at
      end
      row '最終更新日' do
        resource.updated_at
      end
    end
  end
end
