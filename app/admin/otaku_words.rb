ActiveAdmin.register OtakuWord do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :word, :meaning,
                category_and_otaku_word_relationships_attributes: [:id, :category_id, :_destroy]

  ## 入力フォーム
  form do |f|
    f.inputs do
      f.input :word
      f.input :meaning
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
      ## TODO スペルミス categorys -> categories
      word.categorys.each do |category|
        category.name
      end
    end
    column :created_at
    column :updated_at
    actions
  end
  
end
